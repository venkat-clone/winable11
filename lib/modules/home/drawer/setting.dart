// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  bool isMale = true;
  bool isFemale = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: Theme.of(context).textTheme.bodyText2!.color,
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
                        style: Theme.of(context).textTheme.caption!.copyWith(
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
                        style: Theme.of(context).textTheme.caption!.copyWith(
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
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).textTheme.headline6!.color,
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
                          color: Theme.of(context).textTheme.headline6!.color,
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
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppLocalizations.of(
                            'Friends can find and follow you when they sync their\nphone contacts'),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black26,
                              letterSpacing: 0.6,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
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
                    Icon(
                      Icons.exit_to_app,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppLocalizations.of('Logout'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      AppLocalizations.of('Suspend Account'),
                      style: Theme.of(context).textTheme.caption!.copyWith(
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
