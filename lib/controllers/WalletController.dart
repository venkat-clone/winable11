
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
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  Razorpay _razorpay = Razorpay();

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
  Future initiateUPITransaction(BuildContext context,UpiApp app, String amount) async {
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
          merchantId:'BCR2DN4T5KI7F4YI',
          amount: double.parse(amount.trim()),
        );

        if(upiResponse.status == UpiPaymentStatus.SUCCESS ){
          final payment = Payment(amount: amount, transactionID: "");
          await addCash(amount);
        }
        else{
          print("transaction not successful ${upiResponse.toString()}");
        }
        setState(() {
          _upiResponse = upiResponse;
        });
      }on UpiIndiaAppNotInstalledException {
        errorSnackBar( 'Requested app not installed on device',context);
      }
      on UpiIndiaUserCancelledException{
      errorSnackBar( 'You cancelled the transaction',context);
      }
      on UpiIndiaNullResponseException{
      errorSnackBar( 'Requested app didn\'t return any response',context);
      }
      on UpiIndiaInvalidParametersException{
      errorSnackBar( 'Requested app cannot handle the transaction',context);
      }
      catch (e,s){
        errorSnackBar( 'Transaction not completed please try again later',context);
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



  void _handlePaymentError(PaymentFailureResponse response) {

  }

  void _handleExternalWallet(ExternalWalletResponse response) {

  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
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




  payWithWallet() async {
    // call payment api for transaction

  }


  initiateUPITransactionEasyPayments(double amount) async {
    try{
      final res = await EasyUpiPaymentPlatform.instance.startPayment(
        EasyUpiPaymentModel(
          payeeVpa: '7388477549@okbizaxis',
          payeeName: 'Winable Platforms Private Limited',
          amount: amount,
          description: 'Winable Platforms Private Limited',
          payeeMerchantCode: 'BCR2DN4T5KI7F4YI',
          transactionId: currentUser.value.user_id+DateTime.now().microsecondsSinceEpoch.toString(),
          transactionRefId: 'Ref'+currentUser.value.user_id+DateTime.now().microsecondsSinceEpoch.toString()
        )
      );
      addCash(amount.toString());

    } on EasyUpiPaymentException catch(e,s){

      print('message:${e.message}\n details:${e.details} \n stacktrace:$s');
    }
  }


  makePaymentWithRazorpay(double amount) async{
    var options = {
      'key': 'rzp_test_191RXLi8OghRpg',
      'amount': amount*100,
      'name': 'Winable Platforms Private Limited',
      'description': 'add funds to your kyc account',
      'currency':'INR',
      'prefill': {
        'contact': currentUser.value.name,
        'email': currentUser.value.email
      }
    };

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (s){
      addCash(amount.toString());
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.open(options);
  }


}
