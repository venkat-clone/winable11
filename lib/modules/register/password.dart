// ignore_for_file: deprecated_member_use
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/main.dart';
import 'package:newsports/models/AuthUser.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/AuthController.dart';
import '../../utils/constants.dart';
import '../login/otp.dart';

class PasswordPage extends StatefulWidget {

  String email;
  String uName;

  PasswordPage({
    required this.email,
    required this.uName,
  });


  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends StateMVC<PasswordPage> {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conformPasswordController = TextEditingController();
  String errorString = "";

  setError(String error) => setState(() => errorString = error);

  late AuthController _con;

  _PasswordPageState() : super(AuthController()) {
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
  bool conformPassword(){
    if(_passwordController.text!=_conformPasswordController.text){
      setError("conform and password are same");
      return false;
    }
    return true;
  }

  bool validateData() {
    if(!validatePassword()) return false;
    if(!conformPassword()) return false;
    return true;
  }

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
                                    Icon(
                                      Icons.close,
                                      color: Colors.white,
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _passwordController,
                                      hintText: AppLocalizations.of('Password'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomButton(
                                        text: AppLocalizations.of('Register'),
                                        onTap: () async {
                                          if(!validateData()) {
                                            return;
                                          }

                                          final result = await _con.registerWithServer(context,AuthUser(
                                            email: widget.email,
                                            name: widget.uName,
                                            password: _passwordController.text,
                                          ));
                                          if(result) {
                                            _con.successSnackBar("Account Created Successfully", context);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
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
