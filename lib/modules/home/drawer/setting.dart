// ignore_for_file: deprecated_member_use

import 'package:csc_picker/csc_picker.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/AuthController.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../controllers/AuthController.dart';
import '../../../models/user.dart';
import '../../../utils/shared_preference_services.dart';
import '../../../utils/utils.dart';
import '../../../utils/value_notifiers.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends StateMVC<SettingPage> {
  AppUser user = currentUser.value;

  TextEditingController _nameController = TextEditingController(text: currentUser.value.name);
  TextEditingController _emailController = TextEditingController(text: currentUser.value.email);
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController(text: currentUser.value.dob);
  TextEditingController _numberController = TextEditingController(text: Utils.removeCountryCode(currentUser.value.mobile));
  String code = '+91';
  TextEditingController _addressController = TextEditingController(text: currentUser.value.address);
  String _cityName = currentUser.value.city;
  TextEditingController _pinCodeController = TextEditingController(text: currentUser.value.pincode);
  String _stateName = currentUser.value.state;
  String _countryName = currentUser.value.country;
  bool isMale = currentUser.value.gender.toLowerCase() == "male";
  bool isFemale = currentUser.value.gender.toLowerCase() == "female";
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool loading = false;
  late AuthController _con;
  _SettingPageState():super(AuthController()){
    _con = controller as AuthController;
  }


  setLoading(bool loading) => setState(() => this.loading = loading);
  startLoading() => setLoading(true);
  stopLoading() => setLoading(false);
  @override
  void initState() {
    super.initState();
  }

  setupSwitches() async {
    isSwitched1 = await SharedPreferenceService.allowSmsNotification();
    isSwitched2 = await SharedPreferenceService.getDiscoverable();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                AppLocalizations.of('My Info & Settings'),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                      letterSpacing: 0.6,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Name'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter Name'),
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Email'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter Email'),
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Password'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter password'),
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Date of Birth'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                                controller: _birthDateController,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Gender'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            isMale == true
                                ? Icon(
                                    FontAwesomeIcons.dotCircle,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                        isFemale = false;
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.5),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppLocalizations.of('Male'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.5),
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            isFemale == true
                                ? Icon(
                                    FontAwesomeIcons.dotCircle,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        isMale = false;
                                        isFemale = true;
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.5),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppLocalizations.of('Female'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.5),
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Mobile Number'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IntlPhoneField(
                          initialValue: Utils.removeCountryCode(currentUser.value.mobile),
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
                            print('phoneNumber:${phone.number}');
                            _numberController.text = phone.number;
                            code = phone.countryCode;
                          },
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).disabledColor.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of('Privacy Settings'),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .color,
                                      letterSpacing: 0.6,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Expanded(child: SizedBox()),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  color: Theme.of(context).appBarTheme.color,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of('Allow SMS notifications'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .color,
                                letterSpacing: 0.6,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Expanded(child: SizedBox()),
                        CupertinoSwitch(
                          value: isSwitched1,
                          onChanged: (value) {
                            setState(() {
                              isSwitched1 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Address'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter Address'),
                        controller: _addressController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('City'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                        countryDropdownLabel: AppLocalizations.of(_countryName ?? "Country"),
                        stateDropdownLabel: AppLocalizations.of((_stateName.isNotEmpty )? _stateName : "State"),
                        cityDropdownLabel: AppLocalizations.of((_cityName.isNotEmpty )? _cityName : "City"),
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
                          print("countryName:${value.split(' ').last.trim()}");
                          setState(() {
                            _countryName = value.split(' ').last.trim();

                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            _stateName = value??'';
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            _cityName = value??'';
                          });
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Pin code'),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter pin code'),
                        controller: _pinCodeController,
                      ),
                      SizedBox(
                        height: 15,
                      ),


                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => logout(),
                            child: Icon(
                              Icons.exit_to_app,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => logout(),
                            child: Text(
                              AppLocalizations.of('Logout'),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            AppLocalizations.of('Suspend Account'),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: AppLocalizations.of('Update Profile'),
                        onTap: () async {
                          print("userID,${currentUser.value.user_id}");
                          final user = AppUser(
                            user_id: currentUser.value.user_id,
                            name: _nameController.value.text,
                            email: _emailController.value.text,
                            dob: _birthDateController.value.text,
                            mobile: code+_numberController.value.text,
                            address: _addressController.value.text,
                            city: _cityName??'',
                            pincode: _pinCodeController.value.text,
                            state: _stateName??'',
                            country: _countryName??'',
                            gender: isMale ? "male" : "female",
                          );
                          startLoading();
                          await _con.upDateProfile(context, user);

                          stopLoading();
                          SharedPreferenceService.setAllowSmsNotification(isSwitched1);
                          SharedPreferenceService.setDiscoverable(isSwitched1);

                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
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

  showToast(text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
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
        _birthDateController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }


  logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey.shade600,
                  )),
          actions: <Widget>[
            TextButton(
              child: Text('Logout', style: TextStyle(color: Colors.blue)),
              onPressed: () async {

                SharedPreferenceService.initSharedPreferences(login: false);
                Navigator.of(context).popUntil(
                  (route) => !route.isFirst,
                );
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
