import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/models/AuthUser.dart';
import 'package:newsports/repository/auth_repository.dart';

import '../utils/constants.dart';
import '../utils/shared_preference_services.dart';

class AuthController extends ControllerMVC {


  Future wait(int seconds) async {
    return Future.delayed(Duration(seconds: seconds), () => print('Waited $seconds seconds'));
  }

  Future<bool> login(String uName,String password) async {
    // return false;
    var longedIn = false;
    final isEmail = RegExp(Constants.emailRegX).hasMatch(uName);
    final isMobile = RegExp(Constants.mobileRegX).hasMatch(uName);
    print("isEmail=$isEmail");
    // return false;
    if(isEmail) await FirebaseAuth.instance.signInWithEmailAndPassword(email: uName, password: password).then((value) {
      print("loged in with email");
          longedIn = true;

      // we get Firebase User
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
    else if(isMobile) await FirebaseAuth.instance.signInWithPhoneNumber(uName).then((value) {
      longedIn = true;
      // we get Firebase User
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
    else {
      // Sign In With UserId & Password
      // search user name with password if found get them and Login or se other ways
    }
    SharedPreferenceService.setLoggedIn(longedIn);
    return longedIn;


  }


  Future<bool> loginWithGoogle() async {

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if(gUser==null) return false;
    final GoogleSignInAuthentication aAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: aAuth.accessToken,
        idToken: aAuth.idToken
    );

    // sign in
    final signIn = await FirebaseAuth.instance.signInWithCredential(credential);
    final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
    if(email!=null && email!=""){
      // update email to server and handle password from UI
      final user = AuthUser(email: email,provider: Provider.Google,AuthToken: aAuth.idToken??"");
      await AuthRepository.registerUser(user);
      // make api call to register User

    }
    SharedPreferenceService.setGoogleAccessToken(signIn.credential?.accessToken??"");
    SharedPreferenceService.setLoggedIn(true);
    return true;
  }

  Future<bool> loginWithFacebook() async {

    final loginResult = await FacebookAuth.instance.login();
    if(loginResult.status == LoginStatus.failed){
      print("Facebook Auth status Failed");
      print(loginResult.message);
      return false;
    }
    if(loginResult.status != LoginStatus.success) return false;

    if(loginResult.accessToken == null) {
      // show Toast
      return false;
    }

    final credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    // sign in
    final signIn = await FirebaseAuth.instance.signInWithCredential(credential);
    final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
    if(email!=null && email!=""){
      // update email to server and handle password from UI
      final user = AuthUser(email: email,provider: Provider.Google,AuthToken: loginResult.accessToken?.token??"");
      await AuthRepository.registerUser(user);
      // make api call to register User

    }
    SharedPreferenceService.setFaceBookAccessToken(signIn.credential?.accessToken??"");
    SharedPreferenceService.setLoggedIn(true);
    return true;
  }

  Future<bool> registerUser(AuthUser user) async {
    bool UserCreated = false;

    // await wait(10);
    // return true;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user.email, password: user.password)
        .then((value) async{
          await FirebaseAuth.instance.currentUser?.linkWithPhoneNumber(user.mobile);
          await AuthRepository.registerUser(user).then((value) {
            UserCreated = true;
          });
        })
        .onError((error, stackTrace) {
          // show Toast
        });

    return UserCreated;

  }

  Future<bool> sendMobileOTP(String mobile) async{
    bool OTPSend = false;
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobile,
        verificationCompleted: (cred){
          OTPSend = true;
        },
        verificationFailed: (exception){

        },
        codeSent: (id,token){
          // save ID someWare

        },
        codeAutoRetrievalTimeout: (id){

        }
    );
    return OTPSend;
  }

  Future<bool> validatePhoneOTP(int Token,String sms) async{
    bool OTPSend = false;
    final credential = await PhoneAuthProvider.credentialFromToken(Token,smsCode:sms );
    await FirebaseAuth.instance.currentUser?.linkWithCredential(credential).then((value) => {
      OTPSend = true
    });
    return OTPSend;
  }


  Future<bool> sendEmailOTP(String email) async{
    bool OTPSent = false;
    await FirebaseAuth.instance.currentUser?.sendEmailVerification(ActionCodeSettings(url: ""));
    return OTPSent;
  }



}