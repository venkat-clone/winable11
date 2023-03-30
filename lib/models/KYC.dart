import 'dart:io';

class KYCDetails {
  String city = "";
  String pinCode = "";
  String state = "";
  String userAccountName = "";
  String accountNumber = "";
  String bankName = "";
  String ifscCode = "";
  String AadharNumber = "";
  String NameInAadher = "";
  String AadharStatus = "";
  String DOBInAadher = "";
  String AadharImage = "";
  String PanNumber = "";
  String NameInPanCard = "";
  String PanCardStatus = "";
  String PanCardDOB = "";
  String PanCardIMAGE = "";

  KYCDetails(
      {this.city = "",
      this.pinCode = "",
      this.state = "",
      this.userAccountName = "",
      this.accountNumber = "",
      this.bankName = "",
      this.ifscCode = "",
      this.AadharNumber = "",
      this.NameInAadher = "",
      this.AadharStatus = "",
      this.DOBInAadher = "",
      this.AadharImage = "",
      this.PanNumber = "",
      this.NameInPanCard = "",
      this.PanCardStatus = "",
      this.PanCardDOB = "",
      this.PanCardIMAGE = ""});
  Map<String, dynamic> toJson() => {
        "city": city,
        "pincode": pinCode,
        "state": state,
        "user_acc_name": userAccountName,
        "acc_no": accountNumber,
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "aadhar": accountNumber,
        "aadhar_card_name": NameInAadher,
        "aadhar_card_status": AadharStatus,
        "aadhar_card_dob": DOBInAadher,
        "aadhar_card_image": AadharImage,
        "pan_number": PanNumber,
        "pan_card_name": NameInPanCard,
        "pancard_status": PanCardStatus,
        "pancard_dob": PanCardDOB,
        "pancard_image": PanCardIMAGE,
      };
  KYCDetails.fromJson(Map<String, dynamic> json) {
    city = json["city"] ?? "";
    pinCode = json["pincode"] ?? "";
    state = json["state"] ?? "";
    userAccountName = json["user_acc_name"] ?? "";
    accountNumber = json["acc_no"] ?? "";
    bankName = json["bank_name"] ?? "";
    ifscCode = json["ifsc_code"] ?? "";
    accountNumber = json["aadhar"] ?? "";
    NameInAadher = json["aadhar_card_name"] ?? "";
    AadharStatus = json["aadhar_card_status"] ?? "";
    DOBInAadher = json["aadhar_card_dob"] ?? "";
    AadharImage = json["aadhar_card_image"] ?? "";
    PanNumber = json["pan_number"] ?? "";
    NameInPanCard = json["pan_card_name"] ?? "";
    PanCardStatus = json["pancard_status"] ?? "";
    PanCardDOB = json["pancard_dob"] ?? "";
    PanCardIMAGE = json["pancard_image"] ?? "";
  }
}
