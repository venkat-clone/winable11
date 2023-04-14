// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/main.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../controllers/AuthController.dart';
import '../../firebase_options.dart';
import '../../models/AuthUser.dart';
import '../../utils/default_loading.dart';
import '../../utils/shared_preference_services.dart';
import '../../widget/customTextField.dart';

class OTPScreen extends StatefulWidget {

  final String? email;
  String? phone ;
  AuthUser user;
  OTPScreen({
    Key? key,
    this.email,
    this.phone,
    required this.user,
  }):super(key:key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends StateMVC<OTPScreen> {

  String otp = "";

  bool loading = false;
  setLoading(bool loading)=> setState(() => this.loading = loading);
  startLoading()=>setLoading(true);
  stopLoading()=>setLoading(false);

  String error = "";
  setError(String error)=>setState(()=>this.error =error);

  int token = -1;
  String verificationId = "";
  updateToken(int token)=>setState(()=>this.token=token);

  int times =0;
  int remainingTime = 0;
  updateTime(int remaining)=>setState(()=>this.remainingTime=remaining);

  late AuthController _con;
  late bool isMobileNumberAuth ;
  _OTPScreenState():super(AuthController()){
    _con = controller as AuthController;
  }

  startTimer(){
    const duration = Duration(seconds: 30);
    setState(() { remainingTime= duration.inSeconds; });
    Timer.periodic(Duration(seconds: 1), (timer) {
      print(remainingTime);
      setState(() {
        remainingTime--;
      });
      if (remainingTime < 1) {
        timer.cancel();
      }
    });
  }


  sendMobileOTP(String mobile) async{
    startLoading();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobile,
        verificationCompleted: (cred){
          stopLoading();
          print("credential $cred");
          Navigator.of(context).pushNamed(Routes.LOGIN);

        },
        verificationFailed: (exception){
          stopLoading();

          if (exception.code == 'invalid-phone-number') {
            _con.errorSnackBar('The provided phone number is not valid.',context);
          }
          else if (exception.code == 'too-many-requests') {
            _con.errorSnackBar('To Many requests are being made.',context);
          }
          else{
            print("verification Failed:${exception.code}");
            _con.errorSnackBar('Verification failed',context);
          }

        },
        codeSent: (id,token){
          stopLoading();
          verificationId =id;
          updateToken(token??-1);
          startTimer();
        },
        codeAutoRetrievalTimeout: (id){
          print("time Out");
        }
    );

  }


  void sendOTP() async {
    if(isMobileNumberAuth){
      // mobile
      print(widget.phone!);
      sendMobileOTP(widget.phone!);
    }
    else{
      // email

    }
  }



  @override
  void initState() {
    isMobileNumberAuth = !(widget.phone == null);
    super.initState();
    sendOTP();
  }

  validateOTP() async {
    startLoading();
    print("$otp:$token");
    try{
      final credential =
          PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(credential.asMap());
      Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
    }on FirebaseException catch(e,s){
      Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
      // if(e.code=='invalid-credential'){
      //   _con.errorSnackBar("Invalid OTP ", context);
      // }else if(e.code=='session-expired'){
      //   _con.errorSnackBar("OTP Time OUT", context);
      // }

      print(e.code);
    }
    stopLoading();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultLoading(
      loading: loading,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(token>0) Text(
                    AppLocalizations.of('OTP sent to ${widget.email??widget.phone??""}'),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).disabledColor,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of('Enter the OTP you received '),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.caption!.color,
                              letterSpacing: 0.6,
                              fontSize: 14,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: oTPTextWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              remainingTime>0?
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of('You should  receive the OTP in'),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$remainingTime Second..',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xffD30001),
                          letterSpacing: 0.6,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ):
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                      onTap: (){
                        sendOTP();
                      },
                      child: Text("Resend Otp",style: TextStyle(fontSize: 16,color: Colors.white),)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                text: AppLocalizations.of('Next'),
                onTap: () {
                  if(otp.length==6){
                    validateOTP();
                  }else{
                    setError("Please Provide A valid OTP");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TextEditingController> controllers = List.generate(6, (index)=>TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  Widget oTPTextWidget()=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      otpNumberField(0),
      SizedBox(width: 10,),
      otpNumberField(1),
      SizedBox(width: 10,),
      otpNumberField(2),
      SizedBox(width: 10,),
      otpNumberField(3),
      SizedBox(width: 10,),
      otpNumberField(4),
      SizedBox(width: 10,),
      otpNumberField(5)
    ],
  );

  Widget otpNumberField(int index)=>SizedBox(
    width: 40,
    child: TextFormField(
      controller: controllers[index],
      focusNode: focusNodes[index],
      maxLength: 1,
      buildCounter: (context, {currentLength =0, isFocused= false, maxLength}) {},
      keyboardType: TextInputType.number,
      maxLengthEnforcement: null,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      onChanged: (s){
        if(s.length==0){
          if(index-1>-1){
            focusNodes[index-1].requestFocus();
          }
        }else{
          if(index+1<controllers.length ) {
            print(s);
            focusNodes[index+1].requestFocus();
          }else{
            // validate OTP
            final otp =controllers.fold("", (previousValue, element) => previousValue+element.text);
            if(otp.length==6){
              setState(() {this.otp=otp;});
              validateOTP();
            }
          }
        }
      },
      decoration: InputDecoration(
        hintText: "x",
        contentPadding: EdgeInsets.zero,
        hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
          color: Theme.of(context).textTheme.caption!.color,
          letterSpacing: 0.6,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );


}
