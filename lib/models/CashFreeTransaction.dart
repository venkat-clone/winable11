

class CashFreeTransaction{
  int amount =0;
  String orderId="";
  String currency="";
  Details? details;
  Map<String,String>? metaData;
  String orderNode="";

  CashFreeTransaction({
    this.amount=0,
      this.orderId="",
      this.currency="",
      this.details,
      this.metaData,
      this.orderNode="",
  });

  CashFreeTransaction.formJson(Map<String,dynamic> json){
    print(json);
     amount = json["order_amount"];
     orderId = json["order_id"];
     currency = json["order_currency"];
     details = json["customer_details"]!=null?Details.formJson(json["customer_details"]):null;
     metaData = json["order_meta"];
     orderNode = json["order_note"];

  }

  Map<String,dynamic> toJson()=>{
    "order_amount": amount,
    "order_id": orderId,
    "order_currency": currency,
    "customer_details": details?.toJson()??null,
    "order_meta": metaData,
    "order_note": orderNode,
  };

}


class Details{
  String id ="";
  String name="";
  String email ="";
  String phone="";


  Details({this.id="", this.name="", this.email="", this.phone=""});

  toJson()=>{
    "customer_id": id,
    "customer_name": name,
    "customer_email": email,
    "customer_phone": phone
  };

  Details.formJson(Map<String,dynamic> json){
    id = json["customer_id"]??"";
    name = json["customer_name"]??"";
    email = json["customer_email"]??"";
    phone = json["customer_phone"]??"";
  }


}