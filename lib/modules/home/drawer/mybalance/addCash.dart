import 'dart:ffi';
import 'dart:math';
import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsports/models/payment.dart';
import 'package:newsports/widget/customTextField.dart';
import 'package:upi_india/upi_india.dart';

import '../../../../Language/appLocalizations.dart';
import '../../../../controllers/WalletController.dart';

class AddCash extends StatefulWidget {
  @override
  _AddCashState createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;
  String _amount = "0";
  // List<ApplicationMeta>? _apps;
  WalletController _addCashController = WalletController();
  late String txnId;
  late String resCode;
  late String txnRef;
  late String status;
  late String approvalRef;
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
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    Future.delayed(Duration(milliseconds: 0), () async {
      // _apps = await UpiPay.getInstalledUpiApplications(
      //     statusType: UpiApplicationDiscoveryAppStatusType.all);
      setState(() {});
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app, amount) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId:  "7905406363@kotak",
      receiverName: 'Winable Platforms Private Limited',
      // transactionRefId = userId
      transactionRefId: FirebaseAuth.instance.currentUser?.uid??""+"",
      transactionNote: 'payment',
      amount: double.parse(_amount.trim()),
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

  Widget displayUpiApps(amount) {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No Upi Apps found.",
          style: header,
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app, amount);
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
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        Payment _payment = Payment(amount: _amount, transactionID: txnId);
        if (isPaymentAdded == false)
          _addCashController.addCash(FirebaseAuth.instance.currentUser!.uid, _payment);
        isPaymentAdded = true;

        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter amount"),
              onChanged: (value) {
                setState(() {
                  _amount = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(AppLocalizations.of("Available UPI option:")),
          Expanded(
            child: displayUpiApps(_amount),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing

                  txnId = _upiResponse.transactionId ?? 'N/A';
                  resCode = _upiResponse.responseCode ?? 'N/A';
                  txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  status = _upiResponse.status ?? 'N/A';
                  approvalRef = _upiResponse.approvalRefNo ?? 'N/A';

                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          displayTransactionData('Transaction Id', txnId),
                          displayTransactionData('Response Code', resCode),
                          displayTransactionData('Reference Id', txnRef),
                          displayTransactionData(
                              'Status', status.toUpperCase()),
                          displayTransactionData('Approval No', approvalRef),
                        ],
                      ),
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
