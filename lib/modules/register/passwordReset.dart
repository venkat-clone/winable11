import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
  TextEditingController _emailController = TextEditingController();
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
    final password = _emailController.text;
    if (password.isEmpty) {
      setError("Please provide an email or mobile");
      return false;
    }
    final isEmail = RegExp(Constants.emailRegX).hasMatch(password);
    final isMobile = RegExp(Constants.mobileRegX).hasMatch(password);

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
    if(!validateEmail()) return false;
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Forgot Password",style: Theme.of(context).textTheme.titleLarge,),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _emailController,
                                      hintText: AppLocalizations.of('email/mobile'),
                                    ),
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
                                        text: AppLocalizations.of('Reset Password'),
                                        onTap: () async {
                                         if(validateData()){

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



