// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 14, right: 14),
          hintText: hintText,
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
    );
  }
}
