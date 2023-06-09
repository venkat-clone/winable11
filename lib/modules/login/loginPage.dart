// ignore_for_file: deprecated_member_use


import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/foundation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/modules/home/home.dart';
import 'package:newsports/modules/login/otp.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/AuthController.dart';
import '../../main.dart';
import '../../utils/constants.dart';
import '../../utils/shared_preference_services.dart';
import '../register/passwordReset.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorString = "";
  late AuthController _con;
  _LoginScreenState() : super(AuthController()) {
    _con = controller as AuthController;
  }

  bool loading = false;
  /// 0 empty
  /// 1 email
  /// 2 mobile
  int fieldType = 0;
  String code ='+91';

  setLoading(bool loading) => setState(() => this.loading = loading);
  startLoading() => setLoading(true);
  stopLoading() => setLoading(false);

  setError(String error) => setState(() => errorString = error);

  bool validateTextField() {
    final text = _userNameController.value.text;
    if (text.isEmpty && text.length <= 3) return false;
    return true;
  }

  bool validatePassword() => _passwordController.text.isNotEmpty;

  bool validateData() => validateTextField() && validatePassword();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).appBarTheme.color,
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
                                height: AppBar().preferredSize.height,
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
                                radius: 50,
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
                        flex: 2,
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
                                    SizedBox(
                                      height: 15,
                                    ),

                                    // CustomTextField(
                                    //   controller: _userNameController,
                                    //   hintText: AppLocalizations.of(
                                    //       'Mobile No/Email'),
                                    // ),
                                    Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextFormField(
                                        controller: _userNameController,
                                        onChanged: (s){
                                          if(s.isEmpty){
                                            setState(() { fieldType = 0;});
                                          }
                                          else{
                                            final isEmail = RegExp(Constants.emailRegX).hasMatch(s);
                                            final isMobile = RegExp(Constants.mobileRegX).hasMatch(s);
                                            if(isMobile && s.length==10){
                                              setState(() { fieldType = 2;});
                                            }
                                            if(isEmail){
                                              setState(() { fieldType = 1;});
                                            }

                                          }
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 14, right: 14),
                                          hintText: "email/phone",
                                          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Theme.of(context).textTheme.caption!.color,
                                            letterSpacing: 0.6,
                                            fontSize: 14,
                                          ),
                                          prefixIcon: fieldType==1?Icon(Icons.alternate_email):fieldType==2?InkWell(
                                            onTap: () async {
                                              final countryPicker = const  FlCountryCodePicker(
                                                showSearchBar: true,
                                                localize: false,
                                              );
                                              final code = await countryPicker.showPicker(context: context);
                                              if(code!=null){
                                                this.code = code.dialCode;
                                              }
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              // color: Colors.green,
                                              child: Center(child: Text(code,style: TextStyle(
                                              ),)),
                                            ),
                                          ):null,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),

                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _passwordController,
                                      hintText: AppLocalizations.of('Password'),
                                      passwordType: true,
                                    ),
                                    SizedBox(
                                      height: 10,
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
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomButton(
                                        text: AppLocalizations.of('Login'),
                                        onTap: () async {
                                          setError("");
                                          if (!validateData())
                                            return setError(
                                                "Invalid UserName or Password");
                                          startLoading();


                                          try{
                                            print("Uname ${_userNameController.text.trim()}");
                                            await _con.loginToServer((fieldType==2?code:'')+_userNameController.text.trim(), _passwordController.text.trim(), context);
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => HomeScreen(),),
                                            ).then((value) {
                                              print(value);
                                              Navigator.popUntil(
                                                  context, (route) => false);
                                            });
                                          }catch (e){
                                            if(kDebugMode){
                                              print(e);
                                            }
                                          }
                                          stopLoading();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (c)=>PasswordReset()));
                                      },
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of('Forgot Password?'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),

                                    if(kDebugMode)
                                      CustomButton(
                                        text:"Dev Login",
                                        onTap: ()async{
                                          try{
                                            await _con.loginToServer('lingampally.venkey@gmail.com', '12345678', context);
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => HomeScreen(),),
                                            ).then((value) {
                                              print(value);
                                              Navigator.popUntil(
                                                  context, (route) => false);
                                            });
                                          }catch (e){
                                            if(kDebugMode){
                                              print(e);
                                            }
                                          }
                                        },
                                      ),


                                    rowContent(),
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
          if (loading)
            Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget rowContent() {
    return Column(
      children: [
        Row(
          children: [
            if(false)Expanded(
              child: Card(
                shadowColor: Color(0xff1877F2),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () async {
                    setState(() => loading = true);

                    _con.loginWithFacebook().then((value) {
                      setState(() => loading = false);
                      if (value)
                        Navigator.of(context).pushNamed(Routes.HOME);
                      else {
                        // set State Loading False
                      }
                    });
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color(0xff1877F2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            AppLocalizations.of('Facebook'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            if(false)Expanded(
              child: Card(
                shadowColor: Color(0xffD30001),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () async {
                    setState(() => loading = true);

                    _con.loginWithGoogle(context).then((value) {
                      setState(() => loading = false);
                      if (value) if (value)
                        Navigator.of(context).pushNamed(Routes.HOME);
                      else {
                        // set State Loading False
                      }
                    });
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color(0xffD30001),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.googlePlusG,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of('Google'),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
