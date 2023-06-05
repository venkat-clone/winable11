// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final readOnly ;
  final TextInputType? inputType;
  GestureTapCallback? onTap;
  final bool passwordType;
  CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.inputType,
    this.passwordType = false,
    this.readOnly = false,
    this.onTap
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = !widget.passwordType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        keyboardType: widget.inputType,
          obscureText: !_passwordVisible,
        decoration: InputDecoration(
            suffixIcon: widget.passwordType?IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ):null,

          contentPadding: EdgeInsets.only(left: 14, right: 14),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).textTheme.caption!.color,
                letterSpacing: 0.6,
                fontSize: 14,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
