
import 'package:easy_upi_payment/easy_upi_payment.dart';
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
import 'package:newsports/utils/value_notifiers.dart';
import 'package:upi_india/upi_india.dart';
import 'package:upi_india/upi_response.dart';
import '../models/CashFreeTransactionResponse.dart';
import '../models/payment.dart';
import '../models/payment_types.dart';
import '../repository/wallet_repoditory.dart';

class WalletController extends BaseController {

  UpiResponse? _upiResponse;
  UpiResponse? get upiResponse => _upiResponse;
  List<UpiApp> apps = [];
  double totalBalance = currentWallet.value.totalBalance;

  late CashFreeTransaction transaction ;
  CashFreeTransactionResponse? transactionResponse;
  WalletRepository _walletRepository = WalletRepository();
  var cfPaymentGatewayService = CFPaymentGatewayService();
  UpiIndia _upiIndia = UpiIndia();

  UpiIndia get upiIndia => _upiIndia;

  WalletController(){
    scaffoldKey = GlobalKey();
  }

  @override
  void initState() {
    transaction = CashFreeTransaction();
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
    super.initState();
  }

  @override
  Future<bool> initAsync() {

    return super.initAsync();
  }

  /// UPI Methods
  /// Hello World
  Future initiateUPITransaction(UpiApp app, String amount) async {
    lodeWhile(() async{
      try {
        final salt = DateTime.now().millisecond;
        final upiResponse = await _upiIndia.startTransaction(
          app: app,
          receiverUpiId: "7388477549@ybl",
          receiverName: 'Winable Platforms Private Limited',
          // transactionRefId = userId
          transactionRefId: "$salt"+ (currentUser.value.user_id ?? "") ,
          transactionNote: 'payment',
          amount: double.parse(amount.trim()),
        );
        print("status ${upiResponse.status}");
        if(
        upiResponse.status == UpiPaymentStatus.SUCCESS &&
        upiResponse.approvalRefNo !=null
        ){
          final payment = Payment(amount: amount, transactionID: "");
          await addCash(amount);
        }
        else{
          print("transaction not successful ${upiResponse.toString()}");
        }
        setState(() {
          _upiResponse = upiResponse;
        });
      }catch (e,s){
        print("Upi Transaction Error: $e\n$s");
      }
    });
  }

  Future getUPIApps() async {
    lodeWhile(() async{
      try{
        final result =
            await _upiIndia.getAllUpiApps(mandatoryTransactionId: false);
          apps = result;
          await Future.delayed(Duration(seconds: 1));
        setState(() {
        });
        print("result:$result;apps:$apps");
      }catch(e,s){
        print(" getUPIApps Error $e \n $s");
      }
    });
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

  addCash(String amount) async {
    lodeWhile(() async {
      try {
        final cash = await _walletRepository.addCash(amount);
        setState(() {
          totalBalance = double.parse(cash);
        });
      } catch (e) {
        print(e.toString());
      }
    });

  }


  getWalletBalance() async {
    lodeWhile(() async{

    });
  }



  CashFreeTransaction createMocOrder(){
    setState(() {
      transaction = CashFreeTransaction(
        amount: 1,
        orderId: "90909090909099",
        currency: "INR",
        details: Details(
          id:currentUser.value.user_id,
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


  // withdraw amount

  // pay contest fee
  payContestFee(double fee,String contestId){
    /// PAY FEE
    /// JOIN CONTEST
  }

  payWithWallet() async {
    // call payment api for transaction

  }


  initiateUPITransactionEasyPayments(double amount) async {
    try{
      final res = await EasyUpiPaymentPlatform.instance.startPayment(
        EasyUpiPaymentModel(
          payeeVpa: '7388477549@ybl',
          payeeName: 'Winable Platforms Private Limited',
          amount: amount,
          description: 'Winable Platforms Private Limited',
        )
      );
      addCash(amount.toString());
      print(res);
    } on EasyUpiPaymentException {
      // TODO: add your exception logic here
    }
  }


}
