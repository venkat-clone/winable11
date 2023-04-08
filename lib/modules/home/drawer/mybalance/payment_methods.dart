import 'package:flutter/material.dart';
import 'package:newsports/modules/home/drawer/mybalance/upi_Interface.dart';

import '../../../../widget/payment_option_card.dart';

class PaymentMethods extends StatefulWidget {
  double amount;
  PaymentMethods({required this.amount,Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  get amount => widget.amount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Amount to Add"),
                  Expanded(child: SizedBox()),
                  Text("$amount"),
                ],
              ),
            ),
              Divider(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Payment Methods"),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  PaymentOptionCard(
                    title:"UPI",
                    onClick:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UPIInterface(amount: amount.toString(),)));
                    }
                  ),
                  // PaymentOptionCard(
                  //   title:"Easy Payment",
                  //   onClick:(){
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UPIInterface(amount: amount.toString(),)));
                  //   }
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
