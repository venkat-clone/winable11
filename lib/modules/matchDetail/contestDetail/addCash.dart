// ignore_for_file: deprecated_member_use

import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/constance/constance.dart';
import 'package:newsports/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCashPage extends StatefulWidget {
  @override
  _AddCashPageState createState() => _AddCashPageState();
}

class _AddCashPageState extends State<AddCashPage> {
  int totalAmount = 0;

  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Payment method nonce:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Nonce: ${nonce.nonce}'),
            SizedBox(height: 16),
            Text('Type label: ${nonce.typeLabel}'),
            SizedBox(height: 16),
            Text('Description: ${nonce.description}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            height: AppBar().preferredSize.height,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    AppLocalizations.of('Add Cash'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.6,
                          fontSize: 22,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: AppBar().preferredSize.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.wallet,
                    color: Colors.orange,
                    size: 22,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    AppLocalizations.of('Current Balance'),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                          letterSpacing: 0.6,
                          fontSize: 16,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "₹0",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                          letterSpacing: 0.6,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        border: Border(bottom: BorderSide(color: Colors.green)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of('Amount to add'),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Colors.green,
                                    letterSpacing: 0.6,
                                    fontSize: 12,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "₹100",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).textTheme.headline6!.color,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).disabledColor,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
                      child: Text(
                        "₹200",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).disabledColor,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
                      child: Text(
                        "₹200",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).textTheme.headline6!.color,
                              letterSpacing: 0.6,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: CustomButton(
              text: AppLocalizations.of('Add ₹100'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Card(
                    color: Theme.of(context).appBarTheme.color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    child: Container(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppLocalizations.of('Select Payment Option'),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Colors.black,
                                    letterSpacing: 0.6,
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      ConstanceData.razorPay,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Razor Pay",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final request = BraintreePayPalRequest(amount: '13.37');
                                BraintreePaymentMethodNonce? result = await Braintree.requestPaypalNonce(tokenizationKey, request);
                                if (result != null) {
                                  showNonce(result);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.paypal,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Paypal",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                final request = BraintreeCreditCardRequest(
                                  cardNumber: '4111111111111111',
                                  expirationMonth: '12',
                                  expirationYear: '2021',
                                  cvv: '',
                                );
                                BraintreePaymentMethodNonce? result = await Braintree.tokenizeCreditCard(tokenizationKey, request);
                                if (result != null) {
                                  showNonce(result);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Credit card or Debit card",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                var request = BraintreeDropInRequest(
                                  tokenizationKey: tokenizationKey,
                                  collectDeviceData: true,
                                  googlePaymentRequest: BraintreeGooglePaymentRequest(
                                    totalPrice: '4.20',
                                    currencyCode: 'USD',
                                    billingAddressRequired: false,
                                  ),
                                  paypalRequest: BraintreePayPalRequest(
                                    amount: '4.20',
                                    displayName: 'Example company',
                                  ),
                                  cardEnabled: true,
                                );
                                BraintreeDropInResult? result = await BraintreeDropIn.start(request);
                                if (result != null) {
                                  showNonce(result.paymentMethodNonce);
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    child: Icon(Icons.credit_card),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Google Pay",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: Theme.of(context).textTheme.headline6!.color,
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
