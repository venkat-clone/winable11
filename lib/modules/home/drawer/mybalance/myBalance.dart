// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newsports/Language/appLocalizations.dart';
import 'package:newsports/controllers/WalletController.dart';
import 'package:newsports/modules/home/drawer/mybalance/accountInfo.dart';
import 'package:newsports/modules/home/drawer/mybalance/payment_methods.dart';
import 'package:newsports/modules/home/drawer/mybalance/upi_Interface.dart';
import 'package:newsports/modules/home/drawer/mybalance/transaction.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../repository/wallet_repoditory.dart';
import '../../../../utils/value_notifiers.dart';
import '../../../matchDetail/contestDetail/addCash.dart';

class MyBalancePage extends StatefulWidget {
  @override
  _MyBalancePageState createState() => _MyBalancePageState();
}

class _MyBalancePageState extends StateMVC<MyBalancePage> {
  @override
  void initState() {
    super.initState();
    // _paymentController.getCash(FirebaseAuth.instance.currentUser!.uid);
    _walletController.getUPIApps();
    _walletController.getWalletBalance();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late WalletController _walletController;
  _MyBalancePageState() : super(WalletController()) {
    _walletController = controller as WalletController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _walletController.scaffoldKey,
     // backgroundColor: Theme.of(context).appBarTheme.color,
      backgroundColor:Color.fromARGB(255, 52, 78, 68),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of('My Balance'),
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () async {
          final repo = WalletRepository();
          final newWallet = await repo.getWallet();
          setState(() {
            currentWallet.value = newWallet;
            _walletController.totalBalance = currentWallet.value.totalBalance;
          });
          _refreshController.refreshCompleted();
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:  currentUser.value.photo !="" ?NetworkImage(
                                currentUser.value.photo ?? ""):null,
                       ),
                   
                  ),
                      SizedBox(width: 10,),
                        Text(
                            currentUser.value.name,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context)
                                          .textTheme.bodyLarge!
                                          .color,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6,
                                      fontSize: 20,
                                    ),
                          ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (kDebugMode)
                          InkWell(
                            onTap: () async {
                              final repo = WalletRepository();
                              final cash = await repo.addCash("10");
                              setState(() {});
                            },
                            child: Container(
                              color: Colors.green,
                              padding: EdgeInsets.all(20),
                              child: Text("add 10 Rs"),
                            ),
                          ),
                        Card(
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of('Total Balance'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹ ${_walletController.totalBalance.toString()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        letterSpacing: 0.6,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Center(
                                //   child: Container(
                                //     height: 25,
                                //     width: 80,
                                //     decoration: BoxDecoration(
                                //         color: Color(0xff317E2F),
                                //         borderRadius: BorderRadius.circular(4)),
                                //     child: Center(
                                //       child: InkWell(
                                //         onTap: () async {
                                //           // _walletController.initiatePayment("909090909090", "session_tU6-n4GMmVLqxBiljnoy-bF-aI1W_ualmioxJqoGP75pAl9KlT-8BZCxjpu52I8ppFaGAD8Yf1bGmL1AL0ceDM4on8abuANfDhGowUtV8afj");
                                //           // return;
                                //           // final result = await _walletController.createTransaction(_walletController.createMocOrder());
                                //           // if(result!=null && result.paymentSessionId!=null){
                                //           //   _walletController.initiatePayment(result.orderId, result.paymentSessionId!);
                                //           // }else if(result!=null && result.paymentSessionId==null){
                                //           //   // display error
                                //           // }
                                //           Navigator.of(context).push(
                                //               MaterialPageRoute(
                                //                   builder: (context) =>
                                //                       AddCashPage()));
                                //         },
                                //         child: Text(
                                //           AppLocalizations.of('Add Cash'),
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .caption!
                                //               .copyWith(
                                //                 color: Colors.white,
                                //                 letterSpacing: 0.6,
                                //                 fontSize: 12,
                                //                 fontWeight: FontWeight.bold,
                                //               ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of('Unutilized Balance '),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .color,
                                                letterSpacing: 0.6,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "₹${_walletController.totalBalance}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .color,
                                                letterSpacing: 0.6,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold
                                              ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: SizedBox()),
                                   
                                  
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of('Winnings'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
                                              letterSpacing: 0.6,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .color,
                                              letterSpacing: 0.6,
                                              fontSize: 19,
                                               fontWeight: FontWeight.bold
                                            ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                 

                                  ],

                                 
                                ),
                               
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              //padding: EdgeInsets.zero,
                              //margin: ,
                              height: 40,
                              width: 90,
                             decoration: BoxDecoration(
                              color:Theme.of(context).primaryColor,
                               borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                             ),
                             child:Center(
                                      child: InkWell(
                                        onTap: () async {
                                          // _walletController.initiatePayment("909090909090", "session_tU6-n4GMmVLqxBiljnoy-bF-aI1W_ualmioxJqoGP75pAl9KlT-8BZCxjpu52I8ppFaGAD8Yf1bGmL1AL0ceDM4on8abuANfDhGowUtV8afj");
                                          // return;
                                          // final result = await _walletController.createTransaction(_walletController.createMocOrder());
                                          // if(result!=null && result.paymentSessionId!=null){
                                          //   _walletController.initiatePayment(result.orderId, result.paymentSessionId!);
                                          // }else if(result!=null && result.paymentSessionId==null){
                                          //   // display error
                                          // }
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddCashPage()));
                                        },
                                        child: Text(
                                          AppLocalizations.of('Add Cash'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.white,
                                                letterSpacing: 0.6,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                            ),
                            Container(
                              height: 40,
                              width: 90,
                             decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                              color: Colors.red
                             ),
                             child: Center(
                               child: InkWell(
                                          onTap: () async {
                                            // _walletController.initiatePayment("909090909090", "session_tU6-n4GMmVLqxBiljnoy-bF-aI1W_ualmioxJqoGP75pAl9KlT-8BZCxjpu52I8ppFaGAD8Yf1bGmL1AL0ceDM4on8abuANfDhGowUtV8afj");
                                            // return;
                                            // final result = await _walletController.createTransaction(_walletController.createMocOrder());
                                            // if(result!=null && result.paymentSessionId!=null){
                                            //   _walletController.initiatePayment(result.orderId, result.paymentSessionId!);
                                            // }else if(result!=null && result.paymentSessionId==null){
                                            //   // display error
                                            // }
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             AddCashPage()));
                                          },
                                          child: Text(
                                            AppLocalizations.of('Withdraw'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 0.6,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                             ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: SizedBox(width: 20,)),
                             Card(
                              child: SizedBox(width: 150,height: 100,
                              
                              child:   Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  
                                  children: [
                                    Text(
                                      AppLocalizations.of('Cash Bonus'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "₹0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              ),
                             ),
                             Expanded(child: SizedBox(width: 20,)),
                             Card(
                              child: SizedBox(width: 155,height: 100,
                              
                              child:   Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  
                                  children: [
                                    Text(
                                      AppLocalizations.of('Fantasy Coins'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                            letterSpacing: 0.6,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "0.0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Color.fromARGB(255, 241, 162, 26),
                                            letterSpacing: 0.6,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              ),
                             ),
                             Expanded(child: SizedBox(width: 20,)),
                            
                          ],
                        ),
                        container(AppLocalizations.of('My Recent Transactions'),
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionPage(),
                            ),
                          );
                        },
                        
                        ),
                        container(
                          AppLocalizations.of('Refer and Earn'),
                          () {},
                        ),
                    
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget container(String txt1, VoidCallback onTap) {
    return Card(
      child: Container(
        height: 60,
        color: Theme.of(context).appBarTheme.color!.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Row(
              children: [
                Text(
                  txt1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        letterSpacing: 0.6,
                        fontSize: 14,
                      ),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
