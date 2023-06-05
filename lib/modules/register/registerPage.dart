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
  TextEditingController _otpController = TextEditingController();
  String? _countryName ;
  String? _stateName;
  String? _cityName;
  String errorString = "";


  /// not send =0
  /// send = 1
  /// sending = 2
  /// verified = 3
  /// verifying = 4
  int otpStatus = 0;




  setError(String error) => setState(() => errorString = error);

  late AuthController _con;

  _RegisterPageState() : super(AuthController()) {
    _con = controller as AuthController;
  }

  bool validateUName() {
    if (_userNameController.text.length < 3) {
      setError("PLease Enter A valid User Name");
      return false;
    }
    return true;
  }

  bool validateEmail() {
    // _emailController.text.endsWith("@gmail.com")
    if (!_emailController.text.endsWith("@gmail.com")) {
      setError("Please Provide A Valid Email");
      return false;
    }
    if(_emailController.text.length<=13){
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

  bool validatePlace() {
    if (_countryName == null || _countryName == "") {
      setError("please select your Country");
      return false;
    }
    if (_stateName == null || _stateName == "") {
      setError("please select your State");
      return false;
    }
    if (_cityName == null || _cityName == "") {
      setError("please select your City");
      return false;
    }
    return true;
  }

  bool validateDob() {
    if (_dobController.text.isEmpty) {
      setError("Please Enter your Date of Birth");
      return false;
    }
    return true;
  }

  bool validateData() {
    if(!validateUName()) return false;
    if(!validateDob()) return false;
    if(!validatePlace()) return false;
    if(!validateMobile()) return false;
    if(!validateEmail()) return false;
    if(!validatePassword()) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _con.loading || otpStatus==2|| otpStatus==4,
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                    (otpStatus==3)?'enter your details to continue':'verify mobile number to continue',
                                      style: Theme.of(context).textTheme.subtitle2
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:5,
                                          child: Card(
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: IntlPhoneField(
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: 14, right: 14),
                                                  hintText: "Mobile No",
                                                  hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                                    color: Theme.of(context).textTheme.caption!.color,
                                                    letterSpacing: 0.6,
                                                    fontSize: 14,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  counterText: ""
                                              ),
                                              initialCountryCode: 'IN',
                                              onChanged: (phone) {
                                                print(phone.completeNumber);
                                                _mobileController.text = phone.number;
                                                otpStatus = 0;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: InkWell(
                                              onTap: () async {
                                                ///TODO send OTP and set the OTP status
                                                setError('');
                                                if(!validateMobile()) return;
                                                setState(() {
                                                  otpStatus = 2;
                                                });
                                                final status = await _con.sendMobileOTP(context,_mobileController.text,"register");
                                                setState(() {
                                                  otpStatus = (status)?1:0;
                                                });
                                              },
                                              child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                color: Colors.black,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text('Get OTP',style: TextStyle(
                                                        color: Colors.white
                                                    ),
                                                    ),
                                              ),
                                          ),
                                        ),
                                            )
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    if(otpStatus==1)
                                      Column(
                                        children: [
                                          CustomTextField(
                                            hintText: 'enter otp',
                                            controller: _otpController,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: CustomButton(
                                              text: AppLocalizations.of('Verify OTP'),
                                              onTap: () async {
                                                /// TODO verify otp and set the status of otp
                                                setState(() {
                                                  otpStatus = 4;
                                                });
                                                final response = await _con.validatePhoneOTP(context,_mobileController.text,_otpController.text,"register_otp");
                                                setState(() {
                                                  otpStatus = response?3:1;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),

                                    if(otpStatus==3) 
                                      IntrinsicHeight(
                                      child: Column(
                                        children: [
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
                                                          await pickDate();
                                                        },
                                                        icon: Icon(
                                                            Icons.calendar_month)),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextField(
                                                    controller: _dobController,
                                                    readOnly: true,
                                                    hintText: AppLocalizations.of(
                                                        'Pick DOB'),
                                                    onTap: pickDate,
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
                                            countrySearchPlaceholder:
                                            AppLocalizations.of("Country"),
                                            stateSearchPlaceholder:
                                            AppLocalizations.of("State"),
                                            citySearchPlaceholder:
                                            AppLocalizations.of("City"),
                                            countryDropdownLabel: AppLocalizations.of(
                                                _countryName ?? "Country"),
                                            stateDropdownLabel: AppLocalizations.of(
                                                _stateName ?? "State"),
                                            cityDropdownLabel: AppLocalizations.of(
                                                _cityName ?? "City"),
                                            defaultCountry: CscCountry.India,
                                            selectedItemStyle: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
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
                                            controller: _emailController,
                                            hintText: AppLocalizations.of('Email'),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          CustomTextField(
                                            controller: _passwordController,
                                            hintText: AppLocalizations.of('Password'),
                                            passwordType: true,
                                          ),
                                        ],
                                      ),
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
                                    if(otpStatus==3) Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomButton(
                                        text: AppLocalizations.of('Register'),
                                        onTap: () async {
                                          setError("");
                                          if (!validateData()) return;
                                          final user = AuthUser(
                                            name: _userNameController.text,
                                            mobile: _mobileController.text,
                                            password: _passwordController.text,
                                            email: _emailController.text,
                                            dob: _dobController.text,
                                            country: _countryName ?? "",
                                            state: _stateName ?? "",
                                            city: _cityName ?? "",
                                          );

                                          final create = await _con.registerWithServer(context,user);
                                          if(!create) return;
                                          if(create){
                                            Navigator.of(context).pushNamed(Routes.LOGIN);
                                            _con.successSnackBar('Registration successfully', context);
                                          }
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (c) => OTPScreen(
                                          //           phone: user.mobile,
                                          //           user: user,
                                          //         )));

                                          // uncomment in next build
                                          // try{
                                          //   await _con.registerWithServer(user);
                                          //   String phone = _mobileController.text;
                                          //   if (phone.length <= 10) phone = "+91" + phone;
                                          //   Navigator.push(context, MaterialPageRoute(builder: (c) => OTPScreen(phone: phone,)));
                                          // }catch(e){
                                          //   _con.errorSnackBar("Some thing went wrong", context);
                                          //   if(kDebugMode){
                                          //     print(e);
                                          //   }
                                          // }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    if(kDebugMode)Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomButton(
                                        text: AppLocalizations.of('Skip OTP'),
                                        onTap: () async {
                                          setError("");
                                          if (!validateData()) return;
                                          final user = AuthUser(
                                            name: _userNameController.text,
                                            mobile: _mobileController.text,
                                            password: _passwordController.text,
                                            email: _emailController.text,
                                            dob: _dobController.text,
                                            country: _countryName ?? "",
                                            state: _stateName ?? "",
                                            city: _cityName ?? "",
                                          );

                                          final create = await _con.registerWithServer(context,user);
                                          if(!create) return;
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (c) => OTPScreen(
                                          //           phone: user.mobile,
                                          //           user: user,
                                          //         )));

                                          // uncomment in next build
                                          // try{
                                          //   await _con.registerWithServer(user);
                                          //   String phone = _mobileController.text;
                                          //   if (phone.length <= 10) phone = "+91" + phone;
                                          //   Navigator.push(context, MaterialPageRoute(builder: (c) => OTPScreen(phone: phone,)));
                                          // }catch(e){
                                          //   _con.errorSnackBar("Some thing went wrong", context);
                                          //   if(kDebugMode){
                                          //     print(e);
                                          //   }
                                          // }
                                        },
                                      ),
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
          if (_con.loading)
            Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: CircularProgressIndicator()),
            ),
          if(otpStatus==4 || otpStatus==2)
            Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20,),
                  Text(otpStatus==4 ?'verifying OTP':'sending OTP ',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none
                  ),),
                ],
              )),
            ),

        ],
      ),
    );
  }

  pickDate() async {
    DateTime? pickedDate =
        await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year-17),
        firstDate: DateTime(1950),
        // lastDate: DateTime.now().subtract(Duration(days: 365*10)));
        lastDate: DateTime(DateTime.now().year-17));
    if (pickedDate != null) {
      String formattedDate =
      DateFormat(
          'yyyy-MM-dd')
          .format(
          pickedDate);
      setState(() {
        _dobController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }


  Widget rowContent() {
    return Column(
      children: [
        Row(
          children: [
            if(false) Expanded(
              child: Card(
                shadowColor: Color(0xff1877F2),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () async {

                    _con.loginWithFacebook().then((value) {
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
            if(false) SizedBox(
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
                    await _con.loginWithGoogle(context).then((value) {
                      if (value)
                        Navigator.of(context).pushNamed(Routes.HOME);
                      else {
                        setState(() {_con.loading = false;});
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
