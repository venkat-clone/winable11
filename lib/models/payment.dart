class Payment {
  String totalBAlance = "";
  String amount = "";
  String transactionID = "";
  DateTime tDate = DateTime.now();

  Payment({
    this.totalBAlance = "",
    this.amount = "",
    this.transactionID = "",
  });

  Payment.fromJSON(Map<String, String> json) {
    this.amount = json["amount"] ?? "";
    this.transactionID = json["transactionID"] ?? "";
    this.tDate = (json["tDate"] ?? "") as DateTime;
  }
  Map<String, dynamic> toJson() => {
        "amount": amount,
        "transactionID": transactionID,
        "tDate": tDate,
      };
}
