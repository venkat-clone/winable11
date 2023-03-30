


import 'package:newsports/models/user.dart';

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


}


class Provider{
  static final String Google ="Google";
  static final String Facebook ="Facebook";
  static final String Email ="Email";
}