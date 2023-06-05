


import 'package:newsports/models/user.dart';

import '../utils/value_notifiers.dart';

class AuthUser extends AppUser{

  String password="";
  // String mobile="";
  // String email="";
  String AuthToken="";
  // Google/Facebook/Email
  String provider="";
  AuthUser({
    super.name = "",
    this.password = "",
    super.mobile = "",
    super.email = "",
    this.AuthToken = "",
    this.provider = "",
    super.user_id  = "",
    super.dob  = "",
    super.gender  = "",
    super.address  = "",
    super.city  = "",
    super.pincode  = "",
    super.state  = "",
    super.country  = "",

  });

  @override
  AuthUser.fromJSON(Map<String,String> json):super.formJson(json){
    this.password = json["password"]??"";
    this.AuthToken = json["token"]??"";
    this.provider = json["provider"]??"";
  }
  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      "password" : password,
      "token" : AuthToken,
      "provider" :provider,
    });
    return json;
  }


  Map<String,dynamic> toJsonForProfileUpdate()=>{
    "email": email,
    "new_password": password,
    "new_mobile": mobile,
    "allow_sms_notifications": true,
    "make_me_discoverable": false,
    "address": {
      "street": address,
      "city": city,
      "state": state,
      "country": country
    },
    "city": city,
    "pin_code": pincode,
    "state": state,
    "country": country
  };




  Map<String,dynamic> toJsonForProfileUpdateAuth(){
    final json = {
      "user_id": currentUser.value.user_id,
    };

    if(password!=""){
      json["new_password"] = password;
    }
    if(mobile!=currentUser.value.mobile){
     json["new_mobile"]= mobile;
    }

    return json;
  }


  copyWith({
    String? user_id ,
    String? name ,
    String? mobile ,
    String? email ,
    String? dob ,
    String? gender ,
    String? address ,
    String? city ,
    String? pincode ,
    String? state ,
    String? country ,
    String? authId ,
    String? photo ,
    String? password,
  })=>AuthUser(
    user_id :user_id??this.user_id,
    name :name??this.name,
    mobile :mobile??this.mobile,
    email :email??this.email,
    dob :dob??this.dob,
    gender :gender??this.gender,
    address :address??this.address,
    city :city??this.city,
    pincode :pincode??this.pincode,
    state :state??this.state,
    country :country??this.country,
    password :password??this.password,

  );

}


class Provider{
  static final String Google ="Google";
  static final String Facebook ="Facebook";
  static final String Email ="Email";
}