import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/payment.dart';

class PaymentController extends ControllerMVC {
  int totalBalance = 0;
  addCash(authID, Payment _payment) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .collection("addedCash")
          .add(_payment.toJson())
          .whenComplete(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  // getCash(authID) {
  //   try {
  //     FirebaseFirestore.instance
  //         .collection("user")
  //         .doc(authID)
  //         .collection("addedCash")
  //         .snapshots()
  //         .listen((event) {
  //       for (var i = 0; i < event.docs.length; i++) {
  //         totalBalance += int.parse(event.docs[i]['amount']);
  //         print("-----------------------------------");
  //         print(totalBalance);
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
