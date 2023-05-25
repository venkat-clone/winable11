import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/utils/default_state_widget.dart';

import '../../Language/appLocalizations.dart';
import '../../constance/constance.dart';
import '../../controllers/AuthController.dart';
import '../../utils/constants.dart';
import '../../widget/customButton.dart';
import '../../widget/customTextField.dart';


class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  StateMVC<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends StateMVC<PasswordReset> {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _conformPasswordController = TextEditingController();
  String errorString = "";

  setError(String error) => setState(() => errorString = error);

  late AuthController _con;

  _PasswordResetState() : super(AuthController()) {
    _con = controller as AuthController;
  }

  bool validatePassword() {
    final password = _passwordController.text;
    if (password.isEmpty) {
      setError("Password cannot be Empty");
      return false;
    }
    return true;
  }
  bool validateEmail() {
    final email = _mobileController.text;
    if (email.isEmpty) {
      setError("Please provide an email or mobile");
      return false;
    }
    final isEmail = RegExp(Constants.emailRegX).hasMatch(email);
    final isMobile = RegExp(Constants.mobileRegX).hasMatch(email);
    return isEmail || isMobile;
  }

  bool conformPassword(){
    if(_passwordController.text!=_conformPasswordController.text){
      setError("conform and password are same");
      return false;
    }
    return true;
  }

  bool validateData() {
    if(!validateEmail()) return false;
    if(!validatePassword()) return false;
    if(!conformPassword()) return false;
    return true;
  }


  /// not send =0
  /// send = 1
  /// verified = 2
  int otpStatus = 0;



  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _con.loading,
      child: Stack(
        children: [
          Scaffold(
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        Navigator.of(context).pop();
                                        },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  ConstanceData.appLogo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Forgot Password",style: Theme.of(context).textTheme.titleLarge,),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            controller: _mobileController,
                                            hintText: AppLocalizations.of('phone'),
                                          ),
                                        ),
                                          InkWell(
                                          onTap: () async {
                                            if(validateEmail()) {
                                              setState((){
                                                _con.loading = true;
                                              });
                                              final otpSent = await _con.sendMobileOTP(context, _mobileController.text);
                                              if(otpSent) setState(() {
                                                otpStatus = 1;
                                              });
                                              setState((){
                                                _con.loading = false;
                                              });
                                            }
                                          },
                                          child: Card(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Text('get OTP',style: TextStyle(
                                                color: Colors.white
                                              ),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    if(otpStatus==1)
                                      Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              controller: _otpController,
                                              maxLines: 1,
                                              maxLength: 4,
                                              buildCounter: (context, {currentLength =0, isFocused= false, maxLength}) {},
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 14, right: 14),
                                                hintText: 'OTP',
                                                hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                                  color: Theme.of(context).textTheme.caption!.color,
                                                  letterSpacing: 0.6,
                                                  fontSize: 14,
                                                ),

                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async{
                                            setState((){
                                              _con.loading = true;
                                            });
                                            final otpVerified = await _con.validatePhoneOTP(context, _mobileController.text,_otpController.text);
                                            if(otpVerified) setState(() {
                                              otpStatus = 2;
                                            });
                                            setState((){
                                              _con.loading = false;
                                            });
                                          },
                                          child: Card(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Text('Validate OTP',style: TextStyle(
                                                color: Colors.white
                                              ),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    if(otpStatus==2)
                                      CustomTextField(
                                      controller: _passwordController,
                                      hintText: AppLocalizations.of('Password'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    if(otpStatus==2 )
                                      CustomTextField(
                                      controller: _conformPasswordController,
                                      hintText: 'conform Password',
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      errorString,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    if(otpStatus==2 ) Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomButton(
                                        text: AppLocalizations.of('Reset Password'),
                                        onTap: () async {
                                         if(validateData()){
                                           setState((){
                                             _con.loading = true;
                                           });
                                           await _con.reSetPassword(context,_mobileController.text,_passwordController.text);
                                           setState((){
                                             _con.loading = false;
                                           });
                                         }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_con.loading)
            Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}



