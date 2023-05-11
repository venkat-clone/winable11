import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final String mobile;
  final String address;
  final String city;
  final String email;
  final String dob;
  final String gender;
  final String pinCode;
  final String state;
  final String country;

  ProfileDetailsWidget({
    required this.mobile,
    required this.address,
    required this.city,
    required this.email,
    required this.dob,
    required this.gender,
    required this.pinCode,
    required this.state,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    blurRadius: 5.0,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Profile Details',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    flex: 1,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Mobile:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    mobile.isNotEmpty ? mobile : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'Address:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    address.isNotEmpty ? address : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'City:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    city.isNotEmpty ? city : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'Pin Code:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    pinCode.isNotEmpty ? pinCode : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'State:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    state.isNotEmpty ? state : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'Country:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    country.isNotEmpty ? country : 'N/A',
    ),
    ],
    ),
    ),
    Expanded(
    flex: 1,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Email:',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    email.isNotEmpty ? email : 'N/A',
    ),
    SizedBox(height: 16.0),
    Text(
    'Date of Birth:',
    style:
    TextStyle(
      fontWeight: FontWeight.bold,
    ),
    ),
      SizedBox(height: 8.0),
      Text(
        dob.isNotEmpty ? dob : 'N/A',
      ),
      SizedBox(height: 16.0),
      Text(
        'Gender:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.0),
      Text(
        gender.isNotEmpty ? gender : 'N/A',
      ),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
    );
  }
}








