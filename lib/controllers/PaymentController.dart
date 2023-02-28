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
          .whenComplete(() => getCash(authID));
    } catch (e) {
      print(e.toString());
    }
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
          totalBalance = int.parse(value.docs[i]['amount']);
          print(totalBalance);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
