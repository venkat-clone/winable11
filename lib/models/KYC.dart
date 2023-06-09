
import 'package:newsports/utils/value_notifiers.dart';

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
    'email':currentUser.value.email,
    'user_id':currentUser.value.user_id,
        "city": city,
        "pincode": pinCode,
        "state": state,
        "bank_account_name": userAccountName,
        "account_no": accountNumber,
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "aadhar_number": accountNumber,
        "aadhar_card_name": NameInAadher,
        "aadhar_card_dob": DOBInAadher,
        "pancard_number": PanNumber,
        "pancard_name": NameInPanCard,
        "pancard_status": PanCardStatus,
        "pancard_dob": PanCardDOB,
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
