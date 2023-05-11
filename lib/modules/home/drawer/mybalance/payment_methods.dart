import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/modules/home/drawer/mybalance/upi_Interface.dart';

import '../../../../controllers/WalletController.dart';
import '../../../../widget/payment_option_card.dart';

class PaymentMethods extends StatefulWidget {
  double amount;
  PaymentMethods({required this.amount,Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends StateMVC<PaymentMethods> {

  get amount => widget.amount;
  late WalletController _con ;

  _PaymentMethodsState()  : super(WalletController()){
    _con = controller as WalletController;
  }


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
                      _con.initiateUPITransactionEasyPayments(amount);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UPIInterface(amount: amount.toString(),)));
                    }
                  ),
                  PaymentOptionCard(
                    title:"Razorpay",
                    onClick:(){
                      _con.makePaymentWithRazorpay(amount);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UPIInterface(amount: amount.toString(),)));
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


  senMoney() async {
    try{
      final res = await EasyUpiPaymentPlatform.instance.startPayment(
        EasyUpiPaymentModel(
          payeeVpa: '7905406363@kotak',
          payeeName: 'Venkey',
          amount: 10.0,
          description: 'Testing payment',
        ),
      );
      // TODO: add your success logic here
      print(res);
    } on EasyUpiPaymentException {
      // TODO: add your exception logic here
    }
  }


}
