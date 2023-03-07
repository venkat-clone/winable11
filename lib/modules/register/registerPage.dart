// ignore_for_file: deprecated_member_use
import 'package:csc_picker/csc_picker.dart';
import 'package:intl/intl.dart';
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

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends StateMVC<RegisterPage> {
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? _countryName;
  String? _stateName;
  String? _cityName;
  bool loading = false;
  String errorString = "";

  setLoading(bool loading) => setState(() => this.loading = loading);
  startLoading() => setLoading(true);
  stopLoading() => setLoading(false);

  setError(String error) => setState(() => errorString = error);

  late AuthController _con;
  _RegisterPageState() : super(AuthController()) {
    _con = controller as AuthController;
  }

  bool validateUName() {
    if (_userNameController.text.length < 3) {
      setError("PLease Enter A valid userName");
      return false;
    }
    return true;
  }

  bool validateEmail() {
    if (!RegExp(Constants.emailRegX).hasMatch(_emailController.text)) {
      setError("Please Provide A Valid Email");
      return false;
    }
    return true;
  }

  bool validatePassword() {
    final password = _passwordController.text;
    if (password.isEmpty) {
      setError("Password cannot be Empty");
      return false;
    }
    return true;
  }

  bool validateMobile() {
    if (!RegExp(Constants.mobileRegX).hasMatch(_mobileController.text)) {
      setError("Invalid Mobile Number");
      return false;
    }
    return true;
  }

  bool validatePlace(){
    if(_countryName!=null || _countryName==""){
      setError("please select your Country");
      return false;
    }
    if(_stateName!=null || _stateName==""){
      setError("please select your State");
      return false;
    }
    if(_cityName!=null || _cityName==""){
      setError("please select your City");
      return false;
    }
    return true;
  }

  bool dobValidator(){
    if(_dobController.text.isEmpty){
      setError("Please Enter your Date of Birth");
      return false;
    }
    return true;
  }

  bool validateData() => validatePassword() &&
      validateEmail() &&
      validateMobile() &&
      dobValidator() &&
      validatePlace() &&
      validateUName();

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _userNameController,
                                      hintText: AppLocalizations.of('Username'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Card(
                                            shadowColor: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .color,
                                            elevation: 5,
                                            shape: CircleBorder(),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: (Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .color)!,
                                                ),
                                              ),
                                              child: IconButton(
                                                  onPressed: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate: DateTime.now(),
                                                            firstDate: DateTime(1950),
                                                            lastDate: DateTime(2100));
                                                    if (pickedDate != null) {
                                                      String formattedDate =
                                                          DateFormat('yyyy-MM-dd').format(pickedDate);
                                                      setState(() {
                                                        _dobController.text =
                                                            formattedDate; //set output date to TextField value.
                                                      });
                                                    } else {}
                                                  },
                                                  icon: Icon(
                                                      Icons.calendar_month)),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                            child: CustomTextField(
                                              controller: _dobController,
                                              hintText: AppLocalizations.of(
                                                  'Pick DOB'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CSCPicker(
                                      showStates: true,
                                      showCities: true,
                                      flagState: CountryFlag.ENABLE,
                                      dropdownDecoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(2, 4),
                                              blurRadius: 8,
                                              color:
                                                  Color.fromARGB(88, 0, 0, 0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color:
                                            Theme.of(context).backgroundColor,
                                        border: Border.all(
                                          color: (Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color!),
                                        ),
                                      ),
                                      disabledDropdownDecoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(2, 4),
                                              blurRadius: 8,
                                              color:
                                                  Color.fromARGB(88, 0, 0, 0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.grey.shade300,
                                        border: Border.all(
                                          color: (Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color!),
                                        ),
                                      ),
                                      countrySearchPlaceholder: AppLocalizations.of("Country"),
                                      stateSearchPlaceholder: AppLocalizations.of("State"),
                                      citySearchPlaceholder: AppLocalizations.of("City"),
                                      countryDropdownLabel: AppLocalizations.of(
                                          _countryName ?? "Country"),
                                      stateDropdownLabel: AppLocalizations.of(
                                          _stateName ?? "State"),
                                      cityDropdownLabel: AppLocalizations.of(
                                          _cityName ?? "City"),
                                      defaultCountry: CscCountry.India,
                                      selectedItemStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 14,
                                          ),
                                      dropdownHeadingStyle: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 14,
                                          ),
                                      dropdownItemStyle: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 14,
                                          ),
                                      dropdownDialogRadius: 10.0,
                                      searchBarRadius: 30.0,
                                      onCountryChanged: (value) {
                                        setState(() {
                                          _countryName = value;
                                        });
                                      },
                                      onStateChanged: (value) {
                                        setState(() {
                                          _stateName = value;
                                        });
                                      },
                                      onCityChanged: (value) {
                                        setState(() {
                                          _cityName = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _mobileController,
                                      hintText:
                                          AppLocalizations.of('Mobile No.'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _emailController,
                                      hintText: AppLocalizations.of('Email'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextField(
                                      controller: _passwordController,
                                      hintText: AppLocalizations.of('Password'),
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
                                        onTap: () {
                                          setError("");
                                          if (!validateData()) return;

                                          final user = AuthUser(
                                              uName: _userNameController.text,
                                              mobile: _mobileController.text,
                                              password:
                                                  _passwordController.text,
                                              email: _emailController.text);
                                          setState(() => loading = true);
                                          _con.registerUser(user).then((value) {
                                            setState(() => loading = false);
                                            if (value) {
                                              String phone =
                                                  _mobileController.text;
                                              if (phone.length <= 10)
                                                phone = "+91" + phone;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (c) => OTPScreen(
                                                            phone: phone,
                                                          )));
                                            }
                                            // Navigator.pushNamed(context, Routes.LOGIN);
                                            else {
                                              // Toast or Error
                                              debugPrint("error");
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
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
            Expanded(
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
            Expanded(
              child: Card(
                shadowColor: Color(0xffD30001),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () async {
                    setState(() => loading = true);

                    _con.loginWithGoogle().then((value) {
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
