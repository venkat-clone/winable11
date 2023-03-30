// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/user.dart';
import '../../../utils/shared_preference_services.dart';
import '../../../utils/value_notifiers.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  AppUser user = currentUser.value;

  TextEditingController _nameController =
      TextEditingController(text: currentUser.value.name);
  TextEditingController _emailController =
      TextEditingController(text: currentUser.value.email);
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _birthDateController =
      TextEditingController(text: currentUser.value.dob);
  TextEditingController _numberController =
      TextEditingController(text: currentUser.value.mobile);
  TextEditingController _addressController =
      TextEditingController(text: currentUser.value.address);
  TextEditingController _cityController =
      TextEditingController(text: currentUser.value.city);
  TextEditingController _pinCodeController =
      TextEditingController(text: currentUser.value.pincode);
  TextEditingController _stateController =
      TextEditingController(text: currentUser.value.state);
  TextEditingController _countryController =
      TextEditingController(text: currentUser.value.country);
  bool isMale = currentUser.value.gender == "male";
  bool isFemale = currentUser.value.gender == "female";
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool loading = false;
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
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter date of birth'),
                        controller: _birthDateController,
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
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter mobile number'),
                        controller: _numberController,
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
                Container(
                  height: 50,
                  color: Theme.of(context).appBarTheme.color,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of('Make Me Discoverable'),
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
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                AppLocalizations.of(
                                    'Friends can find and follow you when they sync their phone contacts'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black26,
                                      letterSpacing: 0.6,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        CupertinoSwitch(
                          value: isSwitched2,
                          onChanged: (value) {
                            setState(() {
                              isSwitched2 = value;
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
                      CustomTextField(
                        hintText: AppLocalizations.of('Enter City'),
                        controller: _cityController,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('State'),
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
                        hintText: AppLocalizations.of('Enter state'),
                        controller: _stateController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of('Country'),
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
                        hintText: AppLocalizations.of('Enter country'),
                        controller: _countryController,
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
                          final user = AppUser(
                            name: _nameController.value.text,
                            email: _emailController.value.text,
                            dob: _birthDateController.value.text,
                            mobile: _numberController.value.text,
                            address: _addressController.value.text,
                            city: _cityController.value.text,
                            pincode: _pinCodeController.value.text,
                            state: _stateController.value.text,
                            country: _countryController.value.text,
                            gender: isMale ? "male" : "female",
                          );
                          startLoading();
                          if (_passwordController.text.isNotEmpty) {
                            updatePassword(_passwordController.text.trim())
                                .then((value) {
                              value
                                  ? showToast("Update password successful")
                                  : showToast("Update password failed");
                            }).whenComplete(() {});
                          }

                          updateToFirebase(user).then((value) {
                            value
                                ? showToast("Update successful")
                                : showToast("Update failed");
                          }).whenComplete(() => stopLoading());
                          SharedPreferenceService.setAllowSmsNotification(
                              isSwitched1);
                          SharedPreferenceService.setDiscoverable(isSwitched1);
                          SharedPreferenceService.setUser(user);
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

  updateToFirebase(AppUser user) async {
    bool isUpdated = false;

    if (user.email != currentUser.value.email) {
      // update Email
      print("email Updating..");
      await FirebaseAuth.instance.currentUser
          ?.updateEmail(user.email.trim())
          .whenComplete(() {
        isUpdated = true;

        print("Email updated successfully");
      }).onError((error, stackTrace) {
        isUpdated = false;
        print(error.toString());
      });
      print("email Updated");
    }
    if (user.name != currentUser.value.name) {
      // update name
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(user.name)
          .whenComplete(() => isUpdated = true)
          .onError((error, stackTrace) => isUpdated = false);
    }

    currentUser.value = user;
    return isUpdated;
  }

  updatePassword(password) async {
    bool isUpdate = false;
    if (password != null) {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .whenComplete(() {
        print("password upgrade successful");

        isUpdate = true;
      }).onError((error, stackTrace) {
        isUpdate = false;
        print(error.toString());
      });
    } else {
      print("password null");
    }
    return isUpdate;
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
                await FirebaseAuth.instance.signOut();
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
