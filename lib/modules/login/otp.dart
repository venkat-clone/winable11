// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/main.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../controllers/AuthController.dart';
import '../../utils/default_loading.dart';

class OTPScreen extends StatefulWidget {
  final String? email;
  String? phone;
  OTPScreen({Key? key, this.email, this.phone}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends StateMVC<OTPScreen> {
  bool loading = false;
  setLoading(bool loading) => setState(() => this.loading = loading);
  startLoading() => setLoading(true);
  stopLoading() => setLoading(false);

  late AuthController _con;
  late bool isMobileNumberAuth;
  _OTPScreenState() : super(AuthController()) {
    _con = controller as AuthController;
    isMobileNumberAuth = widget.phone != null;
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

  void sendOTP() {
    if (isMobileNumberAuth) {
      // mobile
      _con.sendMobileOTP(widget.phone!);
    } else {
      // email
    }
  }

  @override
  void initState() {
    super.initState();
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
                  Text(
                    AppLocalizations.of(
                        'OTP sent to ${widget.email ?? widget.phone ?? ""}'),
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
                        AppLocalizations.of('Enter the OTP you receivedtext'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).textTheme.caption!.color,
                              letterSpacing: 0.6,
                              fontSize: 14,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.center,
                          obscureText: false,
                          fieldStyle: FieldStyle.underline,
                          keyboardType: TextInputType.number,
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                    AppLocalizations.of('28 Second..'),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xffD30001),
                          letterSpacing: 0.6,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                text: AppLocalizations.of('Next'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.HOME);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
