import 'package:flutter/material.dart';

class DropDownContainer extends StatefulWidget {
  final Widget child;

  const DropDownContainer({Key? key, required this.child}) : super(key: key);

  @override
  _DropDownContainerState createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOpen = !_isOpen;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.child,
          AnimatedContainer(
            duration: Duration(milliseconds: 10000),
            height: _isOpen ? null : 0,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Container content"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

