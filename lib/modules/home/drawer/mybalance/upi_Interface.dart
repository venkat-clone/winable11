
import 'dart:math';
import 'package:easy_upi_payment/easy_upi_payment.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/controllers/PaymentController.dart';
import 'package:newsports/models/payment.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:upi_india/upi_india.dart';

import '../../../../Language/appLocalizations.dart';
import '../../../../controllers/WalletController.dart';

class UPIInterface extends StatefulWidget {

  String amount;
  UPIInterface({required this.amount});

  @override
  _UPIInterfaceState createState() => _UPIInterfaceState();
}

class _UPIInterfaceState extends StateMVC<UPIInterface> {

  String get _amount  => widget.amount;
  late WalletController _con;


  _UPIInterfaceState():super(WalletController()){
    _con = controller as WalletController;
  }


  bool isPaymentAdded = false;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _con.getUPIApps();
    super.initState();
  }





  // Future<UpiTransactionResponse> initiateUPITransaction(ApplicationMeta app,String amount) async {
  //   final transactionRef = FirebaseAuth.instance.currentUser?.uid??""+Random.secure().nextInt(1 << 32).toString();
  //   return await UpiPay.initiateTransaction(
  //     amount: amount,
  //     app: app.upiApplication,
  //     receiverName: 'Sharad',
  //     receiverUpiAddress: "7905406363@kotak",
  //     transactionRef: transactionRef,
  //     transactionNote: 'UPI Payment',
  //     // merchantCode: '7372',
  //   );
  // }


  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of("$title: "),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black54,
                  letterSpacing: 0.6,
                  fontSize: 12,
                ),
          ),
          Flexible(
              child: Text(
            AppLocalizations.of(body),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black54,
                  letterSpacing: 0.6,
                  fontSize: 12,
                ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('Add Cash'),
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
      body: _con.loading?
      Center(child: CircularProgressIndicator())
          :Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width - 50,
          //   child: TextField(
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(hintText: "Enter amount"),
          //     onChanged: (value) {
          //       setState(() {
          //         _amount = value;
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Amount to Add"),
                Expanded(child: SizedBox()),
                Text("$_amount"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(AppLocalizations.of("Available UPI option:")),
          Expanded(
            child: _con.apps.isEmpty?ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(
                                    'We have not found active upi app'),
                                style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                  color: Colors.black87,
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 42),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                          'Install UPI payment application'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Colors.black54,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 42),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                          'Open app and Create UPI ID'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Colors.black54,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 42),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                          'Activate your bank account'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Colors.black54,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ):
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  children: _con.apps.map<Widget>((UpiApp app) {
                    return GestureDetector(
                      onTap: () {
                        _con.initiateUPITransaction(context,app, _amount);
                        setState(() {});
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.memory(
                              app.icon,
                              height: 60,
                              width: 60,
                            ),
                            Text(app.name),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if(_con.upiResponse!=null)
            Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    displayTransactionData('Transaction Id', _con.upiResponse?.transactionId ?? 'N/A'),
                    displayTransactionData('Response Code', _con.upiResponse?.transactionId ?? 'N/A'),
                    displayTransactionData('Reference Id', _con.upiResponse?.transactionRefId ?? 'N/A'),
                    displayTransactionData('Status', (_con.upiResponse?.status ?? 'N/A').toUpperCase()),
                    displayTransactionData('Approval No', _con.upiResponse?.approvalRefNo ?? 'N/A'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
