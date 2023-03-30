

import 'package:flutter/cupertino.dart';
import 'package:newsports/models/CashFreeTransaction.dart';

class CashFreeTransactionResponse extends CashFreeTransaction {

  int cfOrderId =0;
  String entity="";
  String expiryTime ="";
  Map<String,dynamic> settlements={};
  Map<String,dynamic> payments={};
  Map<String,dynamic> refunds={};
  String status="";
  String? token;
  String? paymentLink;
  String? paymentSessionId;

  CashFreeTransactionResponse(
      this.cfOrderId,
      this.entity,
      this.expiryTime,
      this.settlements,
      this.payments,
      this.refunds,
      this.status,
      this.token,
      this.paymentLink,
      this.paymentSessionId,
  {
    super.amount=0,
    super.orderId="",
    super.currency="",
    super.details,
    super.metaData,
    super.orderNode="",
  }
      );
  @override
  CashFreeTransactionResponse.formJson(Map<String,dynamic> json):super.formJson(json){
    cfOrderId = json["cf_order_id"]??0;
    entity = json["entity"]??"";
    expiryTime = json["order_expiry_time"]??"";
    settlements = json["settlements"]??"";
    payments = json["payments"]??"";
    refunds = json["refunds"]??"";
    status = json["order_status"]??"";
    token = json["order_token"];
    paymentLink = json["payment_link"];
    paymentSessionId = json["payment_session_id"];

  }

  @override
  toJson() {
    final result = super.toJson();
    result.addAll({
      "cf_order_id":cfOrderId ,
      "entity":entity ,
      "order_expiry_time":expiryTime ,
      "settlements":settlements ,
      "payments":payments ,
      "refunds":refunds ,
      "order_status":status ,
      "order_token":token ,
      "payment_link":paymentLink ,
      "payment_session_id":paymentSessionId ,
    });
    return result;
  }





}