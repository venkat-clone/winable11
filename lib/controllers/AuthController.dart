import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
import '../modules/register/password.dart';
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

  Future<bool> loginWithGoogle(BuildContext context) async {
    try{
      await lodeWhile(() async {
        final GoogleSignInAccount? gUser = await GoogleSignIn(scopes: [
          'https://www.googleapis.com/auth/user.birthday.read',
          'https://www.googleapis.com/auth/user.addresses.read'
        ]).signIn();

        if (gUser == null) return false;
        Navigator.of(context).push(MaterialPageRoute(builder: (c)=>PasswordPage(email: gUser.email,uName: gUser.displayName??"",)));
        return false;
        final GoogleSignInAuthentication aAuth = await gUser.authentication;
        // print(gUser.toString());
        // final credential = GoogleAuthProvider.credential(accessToken: aAuth.accessToken, idToken: aAuth.idToken);


        /// https://www.googleapis.com/auth/user.addresses.read


        // print(credential.asMap());

        // throw Exception();

        // sign in
        // final signIn =
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        // final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
        // // setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
        // if (email != null && email != "") {
        //   // update email to server and handle password from UI
        //   final user = AuthUser(
        //       email: email,
        //       provider: Provider.Google,
        //       AuthToken: aAuth.idToken ?? "");
        //   await _repository.registerUser(user);
        //   // make api call to register User
        // }
        // SharedPreferenceService.setGoogleAccessToken(
        //     signIn.credential?.accessToken ?? "");
        setUpLocalUser();
      });
      return false;
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

        // final credential =
        //     FacebookAuthProvider.credential(loginResult.accessToken!.token);
        // sign in
        // final signIn =
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        // final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
        // // setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
        // if (email != null && email != "") {
        //   // update email to server and handle password from UI
        //   final user = AuthUser(
        //       email: email,
        //       provider: Provider.Google,
        //       AuthToken: loginResult.accessToken?.token ?? "");
        //   await _repository.registerUser(user);
        //   // make api call to register User
        // }
        // SharedPreferenceService.setFaceBookAccessToken(
        //     signIn.credential?.accessToken ?? "");
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
    // final user = localUser ??
        // AppUser(
        //   email: FirebaseAuth.instance.currentUser?.email ?? "",
        //   mobile: FirebaseAuth.instance.currentUser?.phoneNumber ?? "",
        //   name: FirebaseAuth.instance.currentUser?.displayName ?? "",
        // );
    // print(user);
    // SharedPreferenceService.setVerified(true);
    // SharedPreferenceService.setUser(user);
    // currentUser.value = user;
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
      final isEmail = RegExp(Constants.emailRegX).hasMatch(id);
      // final isEmail = true;
      final isMobile = RegExp(Constants.mobileRegX).hasMatch(id);

      print("info $id");
      AuthUser user = AuthUser(password: password);
      if(isEmail){
        user.email = id;
      }
      if(isMobile){
        user.mobile = id;
      }

      try{
        final loginUser = await _repository.login(user);
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

  Future<bool> sendMobileOTP(BuildContext context,String mobile) async {
    bool OTPSend = false;
    try{
      final response = await _repository.sendOtp(mobile);
      OTPSend = (response['type']=='success');
      if(!OTPSend) errorSnackBar(response['message'], context);
    }catch(e){
      errorSnackBar('something went wrong please try again', context);
    }
    return OTPSend;
  }


  Future<bool> validatePhoneOTP(BuildContext context,String mobile, String otp) async {
    bool OTPVerified = false;
    try{
      final response = await _repository.verifyOtp(mobile,otp);
      OTPVerified = (response['type']=='success');
      if(!OTPVerified) errorSnackBar(response['message'], context);
    }catch(e){
      errorSnackBar('something went wrong please try again', context);
    }
    return OTPVerified;
  }

  Future<bool> sendEmailOTP(String email) async {
    bool OTPSent = false;
    // await FirebaseAuth.instance.currentUser
    //     ?.sendEmailVerification(ActionCodeSettings(url: ""));
    return OTPSent;
  }

  reSetPassword(BuildContext context,String phone,String password) async{
    try{
      await _repository.resetPassword(phone, password);
      successSnackBar('your password has been updated successfully', context);
    } on AppException catch(e){
      errorSnackBar(e.getMessage(), context);
    } catch(e){

    }
  }

  upDateProfile(BuildContext context,AppUser user) async{
    try{
      await _repository.updateProfile(user);
      SharedPreferenceService.setUser(user);
      setState(() {
        currentUser.value = user;
      });

    }catch(e,s){
      print("$e\n$s");
      errorSnackBar("something went wrong", context);
    }
  }

}
