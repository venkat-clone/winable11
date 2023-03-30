import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/models/AuthUser.dart';
import 'package:newsports/repository/auth_repository.dart';
import 'package:newsports/utils/app_execptions.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/shared_preference_services.dart';
import '../utils/value_notifiers.dart';

class AuthController extends BaseController {

  late AuthRepository _repository ;
  AuthController(){
    _repository = AuthRepository();
  }


  Future wait(int seconds) async {
    return Future.delayed(
        Duration(seconds: seconds), () => print('Waited $seconds seconds'));
  }

  Future<bool> login(String uName, String password) async {
    // return false;
    var longedIn = false;
    final isEmail = RegExp(Constants.emailRegX).hasMatch(uName);
    final isMobile = RegExp(Constants.mobileRegX).hasMatch(uName);
    print("isEmail=$isEmail");
    // return false;
    if (isEmail)
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: uName, password: password)
          .then((value) {
        print("loged in with email");
        longedIn = true;

        // we get Firebase User
      }).onError((error, stackTrace) {
        print(error);
        print(stackTrace);
      });
    else if (isMobile)
      await FirebaseAuth.instance.signInWithPhoneNumber(uName).then((value) {
        longedIn = true;
        // we get Firebase User
      }).onError((error, stackTrace) {
        print(error);
        print(stackTrace);
      });


    setUpLocalUser();
    return longedIn;
  }

  Future<bool> loginWithGoogle() async {
    try{
      await lodeWhile(() async {
        final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

        if (gUser == null) return false;
        final GoogleSignInAuthentication aAuth = await gUser.authentication;
        // print(gUser.toString());

        final credential = GoogleAuthProvider.credential(accessToken: aAuth.accessToken, idToken: aAuth.idToken);


        // print(credential.asMap());

        // throw Exception();

        // sign in
        final signIn =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
        setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
        if (email != null && email != "") {
          // update email to server and handle password from UI
          final user = AuthUser(
              email: email,
              provider: Provider.Google,
              AuthToken: aAuth.idToken ?? "");
          await _repository.registerUser(user);
          // make api call to register User
        }
        SharedPreferenceService.setGoogleAccessToken(
            signIn.credential?.accessToken ?? "");
        setUpLocalUser();
      });
      return true;
    }catch(e,s){
      stopLoading();
      if(kDebugMode){
        print("Registration Error \t $e \n $s");
      }
      errorSnackBar("Some Thing Went Wrong", lastContext!);
      return false;
    }
  }

  Future<bool> loginWithFacebook() async {
    try{
      await lodeWhile(() async {
        final loginResult = await FacebookAuth.instance.login();
        if (loginResult.status == LoginStatus.failed) {
          print("Facebook Auth status Failed");
          print(loginResult.message);
          return false;
        }
        if (loginResult.status != LoginStatus.success) return false;

        if (loginResult.accessToken == null) {
          // show Toast
          return false;
        }

        final credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        // sign in
        final signIn =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
        setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
        if (email != null && email != "") {
          // update email to server and handle password from UI
          final user = AuthUser(
              email: email,
              provider: Provider.Google,
              AuthToken: loginResult.accessToken?.token ?? "");
          await _repository.registerUser(user);
          // make api call to register User
        }
        SharedPreferenceService.setFaceBookAccessToken(
            signIn.credential?.accessToken ?? "");
        setUpLocalUser();
      });
    return true;
    }
    catch(e,s){
      if(kDebugMode){
        print("Registration Error \t $e \n $s");
      }
      errorSnackBar("Some Thing Went Wrong", lastContext!);
      return false;
    }
  }

  setUpLocalUser({AppUser? localUser}) {
    SharedPreferenceService.initSharedPreferences(login: true);
    final user = localUser ??
        AppUser(
          email: FirebaseAuth.instance.currentUser?.email ?? "",
          mobile: FirebaseAuth.instance.currentUser?.phoneNumber ?? "",
          name: FirebaseAuth.instance.currentUser?.displayName ?? "",
        );
    print(user);
    SharedPreferenceService.setVerified(true);
    SharedPreferenceService.setUser(user);
    currentUser.value = user;
  }

  Future<bool> registerUser(AuthUser user) async {
    bool UserCreated = false;


    print(user.email);
    await lodeWhile(() async {
      try{
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: user.email, password: user.password)
            .then((value) async {
          UserCreated = true;
          print("user created");
          await FirebaseAuth.instance.currentUser?.updateDisplayName(user.name);
          await FirebaseAuth.instance.currentUser
              ?.linkWithPhoneNumber(user.mobile);

          await _repository.registerUser(user).then((value) {
            UserCreated = true;
          });
          if (FirebaseAuth.instance.currentUser != null)
            setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);

          SharedPreferenceService.setUser(user);
          currentUser.value = user;
        }).onError((error, stackTrace) {
          // show Toast
        });

      }catch(e,s){
        if(!UserCreated)
          UserCreated=false;
        if(kDebugMode){
          print("Registration Error \t $e \n $s");
        }
        errorSnackBar("Some Thing Went Wrong", lastContext!);
      }

    });
    return UserCreated;
    // return UserCreated;
  }

  Future<bool> registerWithServer(BuildContext context,AuthUser user) async{

    var status = false;
    await lodeWhile(() async{
      try {
        await _repository.registerUser(user);
        status = true;
      } on FetchDataException {
        errorSnackBar("Please check you internet connection", context);
      } on InvalidResponseException catch (e, s) {
        errorSnackBar(e.getMessage(), context);
      } catch (e, s) {
        print("Normal $e,$s");
        status = false;
      }
    });
    return status;
  }

  Future loginToServer(String id,String password,BuildContext context) async{
    await lodeWhile(() async{
      // final isEmail = RegExp(Constants.emailRegX).hasMatch(id);
      final isEmail = true;
      final isMobile = RegExp(Constants.mobileRegX).hasMatch(id);

      AuthUser user = AuthUser(password: password);
      if(isEmail){
        user.email = id;
      }
      if(isMobile){
        user.mobile = id;
      }

      try{
        final loginUser = await _repository.login(id,password);
        SharedPreferenceService.setUser(loginUser);
        SharedPreferenceService.setLoggedIn(true);
        currentUser.value = loginUser;
        print("login completed");
      } on InvalidResponseException {
        errorSnackBar("Invalid UserId & Password", context);
        rethrow;
      } on FetchDataException{
        errorSnackBar("Please check you internet connection", context);
        rethrow;
      } catch(e) {
        errorSnackBar("Some thing went wrong", context);
        if (kDebugMode) {
          errorSnackBar(e.toString(), context);
        }
        rethrow;
      }
    });

  }


  // call after OTP validation
  updateUserToServer(AuthUser user) async {
    await _repository.registerUser(user).then((value) {});
  }

  Future<bool> sendMobileOTP(String mobile) async {
    bool OTPSend = false;
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobile,
        verificationCompleted: (cred) {
          OTPSend = true;
        },
        verificationFailed: (exception) {},
        codeSent: (id, token) {
          // save ID someWare
        },
        codeAutoRetrievalTimeout: (id) {});
    return OTPSend;
  }

  Future<bool> validatePhoneOTP(int Token, String sms) async {
    bool OTPSend = false;
    final credential =
        await PhoneAuthProvider.credentialFromToken(Token, smsCode: sms);
    await FirebaseAuth.instance.currentUser
        ?.linkWithCredential(credential)
        .then((value) => {OTPSend = true});
    return OTPSend;
  }

  Future<bool> sendEmailOTP(String email) async {
    bool OTPSent = false;
    await FirebaseAuth.instance.currentUser
        ?.sendEmailVerification(ActionCodeSettings(url: ""));
    return OTPSent;
  }

  // move this to KYC Controller
  setKYCStatus(authID, status) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .get()
          .then((value) async {
        if (value.exists) {
          getKYCStatus(authID);
        } else {
          await FirebaseFirestore.instance.collection("user").doc(authID).set(
              {"kycStatus": status}).whenComplete(() => getKYCStatus(authID));
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getKYCStatus(authID) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .get()
          .then((value) =>
              SharedPreferenceService.setKYC(value.data()!['kycStatus']));
    } catch (e) {}
  }

  upDateKYCStatus(authID, status) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .update({"kycStatus": status})
          .onError((error, stackTrace) => print(error))
          .whenComplete(() => getKYCStatus(authID));
    } catch (e) {}
  }

}
