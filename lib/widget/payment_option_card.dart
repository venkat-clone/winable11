import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {

  void Function() onClick;
  String title;
  PaymentOptionCard({
    required this.title,
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(child: Text(title)),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
