import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/models/AuthUser.dart';
import 'package:newsports/repository/auth_repository.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/shared_preference_services.dart';
import '../utils/value_notifiers.dart';

class AuthController extends ControllerMVC {
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
    if (isEmail)
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: uName, password: password)
          .then((value) async {
        print("loged in with email");
        setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
        // await FirebaseAuth.instance.currentUser?.updateDisplayName("User 19001");
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
    else {
      // Sign In With UserId & Password
      // search user name with password if found get them and Login or se other ways
    }

    setUpLocalUser();
    return longedIn;
  }

  Future<bool> loginWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) return false;
    final GoogleSignInAuthentication aAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: aAuth.accessToken, idToken: aAuth.idToken);

    // sign in
    final signIn = await FirebaseAuth.instance.signInWithCredential(credential);
    final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
    setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
    if (email != null && email != "") {
      // update email to server and handle password from UI
      final user = AuthUser(
          email: email,
          provider: Provider.Google,
          AuthToken: aAuth.idToken ?? "");
      await AuthRepository.registerUser(user);
      // make api call to register User
    }
    SharedPreferenceService.setGoogleAccessToken(
        signIn.credential?.accessToken ?? "");
    setUpLocalUser();
    return true;
  }

  Future<bool> loginWithFacebook() async {
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
    final signIn = await FirebaseAuth.instance.signInWithCredential(credential);
    final email = FirebaseAuth.instance.currentUser?.providerData[0].email;
    setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
    if (email != null && email != "") {
      // update email to server and handle password from UI
      final user = AuthUser(
          email: email,
          provider: Provider.Google,
          AuthToken: loginResult.accessToken?.token ?? "");
      await AuthRepository.registerUser(user);
      // make api call to register User
    }
    SharedPreferenceService.setFaceBookAccessToken(
        signIn.credential?.accessToken ?? "");
    setUpLocalUser();
    return true;
  }

  setUpLocalUser({LocalUser? localUser}) {
    SharedPreferenceService.initSharedPreferences(login: true);
    final user = localUser ??
        LocalUser(
          email: FirebaseAuth.instance.currentUser?.email ?? "",
          mobile: FirebaseAuth.instance.currentUser?.phoneNumber ?? "",
          name: FirebaseAuth.instance.currentUser?.displayName ?? "",
        );
    SharedPreferenceService.setVerified(true);
    SharedPreferenceService.setUser(user);
    currentUser.value = user;
  }

  Future<bool> registerUser(AuthUser user) async {
    bool UserCreated = false;

    // await wait(10);
    // return true;
    print(user.email);

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password)
        .then((value) async {
      UserCreated = true;
      print("user created");
      await FirebaseAuth.instance.currentUser?.updateDisplayName(user.uName);
      await FirebaseAuth.instance.currentUser?.linkWithPhoneNumber(user.mobile);

      await AuthRepository.registerUser(user).then((value) {
        UserCreated = true;
      });
      if (FirebaseAuth.instance.currentUser != null)
        setKYCStatus(FirebaseAuth.instance.currentUser!.uid, false);
      final localUser =
          LocalUser(name: user.uName, mobile: user.mobile, email: user.email);
      SharedPreferenceService.setUser(localUser);
      currentUser.value = localUser;
    }).onError((error, stackTrace) {
      // show Toast
    });

    return UserCreated;
  }

  // call after OTP validation
  updateUserToServer(AuthUser user) async {
    await AuthRepository.registerUser(user).then((value) {});
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
