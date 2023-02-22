


class AuthUser{
  String uName="";
  String password="";
  String mobile="";
  String email="";
  String AuthToken="";
  String dob="";
  // Google/Facebook/Email
  String provider="";
  AuthUser({
    this.uName = "",
    this.password = "",
    this.mobile = "",
    this.email = "",
    this.AuthToken = "",
    this.provider = "",
  });

  AuthUser.fromJSON(Map<String,String> json){
    this.uName = json["name"]??"";
    this.password = json["password"]??"";
    this.mobile = json["mobile"]??"";
    this.email = json["email"]??"";
    this.AuthToken = json["token"]??"";
    this.provider = json["provider"]??"";
  }
  Map<String, dynamic> toJson() => {
    "name" : uName,
    "password" : password,
    "mobile" : mobile,
    "email" : email,
    "token" : AuthToken,
     "provider" :provider,
  };


}


class Provider{
  static final String Google ="Google";
  static final String Facebook ="Facebook";
  static final String Email ="Email";
}