import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/models/CashFreeTransaction.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import '../models/CashFreeTransactionResponse.dart';
import '../models/payment.dart';
import '../repository/wallet_repoditory.dart';

class WalletController extends BaseController {

  double totalBalance = 0;

  late CashFreeTransaction transaction ;
  CashFreeTransactionResponse? transactionResponse;
  WalletRepository _walletRepository = WalletRepository();
  var cfPaymentGatewayService = CFPaymentGatewayService();
  @override
  void initState() {
    transaction = CashFreeTransaction();
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
    super.initState();
  }


// Callback methods
  void verifyPayment(String orderId) {
    print("Verify Payment");
    // TODO verify payment and add funds to server

  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    print("Error while making payment");
    // TODO display Error to UI
  }

  addCash(authID, Payment _payment) async {
    lodeWhile(() async {
      try {
        await FirebaseFirestore.instance
            .collection("user")
            .doc(authID)
            .collection("addedCash")
            .add(_payment.toJson())
            .whenComplete(() async {
              await _setAccountBalance(double.parse(_payment.amount));
            });
      } catch (e) {
        print(e.toString());
      }
    });

  }

  // maxBalance()=>_setAccountBalance(0);

  _setAccountBalance(double amount){
    lodeWhile(() async {
          await FirebaseFirestore.instance
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({"Total_balance": amount});
        });
  }

  getWalletBalance() async {
    lodeWhile(() async{
      final document = await FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).get();
      print(document.data()?["Total_balance"]);
      if(document.data()?["Total_balance"]==null) {
        print("Document Not Found");
        await FirebaseFirestore.instance
            .collection("user")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({"Total_balance": 0});
      }
      else{
        setState(() {totalBalance = document.data()?["Total_balance"]??0;});
        print("balance:$totalBalance==${document.data()?["Total_balance"]??0}");
      }
    });
  }

  getCash(authID) {
    try {
      FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .collection("addedCash")
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          totalBalance = double.parse(value.docs[i]['amount']);
          print(totalBalance);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  CashFreeTransaction createMocOrder(){
    setState(() {
      transaction = CashFreeTransaction(
        amount: 1,
        orderId: "90909090909099",
        currency: "INR",
        details: Details(
          id:FirebaseAuth.instance.currentUser?.uid??"",
          name: "Venkey Dev",
          email: "Lingampally.venkey@gmail.com",
          phone: "8184926683"
        ),
        metaData: {
          "notify_url": "https://test.cashfree.com"
        },
        orderNode: "Test Note"
      );
    });
    return transaction;
  }

  Future<CashFreeTransactionResponse?> createTransaction(CashFreeTransaction transaction) async {
    await lodeWhile(() async{
      try{
        transactionResponse = await _walletRepository.createTransaction(transaction);
        setState(() { });
        return transactionResponse;
      }catch(e){
        print(e);
      }
    });
    return null;
  }


  initiatePayment(String orderId,String paymentSessionId){
    lodeWhile(() async{
      try {
        var session = CFSessionBuilder().setEnvironment(
            CFEnvironment.SANDBOX)
            .setOrderId(orderId)
            .setPaymentSessionId(paymentSessionId)
            .build();

        List<CFPaymentModes> components = <CFPaymentModes>[];
        components.add(CFPaymentModes.UPI);
        components.add(CFPaymentModes.CARD);
        components.add(CFPaymentModes.WALLET);
        var paymentComponent = CFPaymentComponentBuilder()
            .setComponents(components)
            .build();

        var theme = CFThemeBuilder().setNavigationBarBackgroundColorColor(
            "#FF0000").setPrimaryFont("Menlo")
            .setSecondaryFont("Futura")
            .build();
        var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder().setSession(session!).setPaymentComponent(paymentComponent).setTheme(theme).build();

        cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
        return session;
      } on CFException catch (e) {
        print(e.message);
      }
    });
  }




}
