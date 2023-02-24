

class LocalUser{
  String user_id = "";
  String name = "";
  String mobile = "";
  String email = "";
  String dob = "";
  String gender = "";
  String address = "";
  String city = "";
  String pincode = "";
  String state = "";
  String country = "";

  int level = 0;
  int followers = 0;
  int following = 0;
  int posts = 0;
  int contests =0;
  int matches = 0;
  int series =0;
  int wins =0;





  LocalUser({
    this.user_id  = "",
    this.name  = "",
    this.mobile  = "",
    this.email  = "",
    this.dob  = "",
    this.gender  = "",
    this.address  = "",
    this.city  = "",
    this.pincode  = "",
    this.state  = "",
    this.country  = "",
  });

  LocalUser.formJson(Map<String,dynamic> json){
    this.user_id = json['user_id']??"";
    this.name = json['name']??"";
    this.mobile = json['mobile']??"";
    this.email = json['email']??"";
    this.dob = json['dob']??"";
    this.gender = json['gender']??"";
    this.address = json['address']??"";
    this.city = json['city']??"";
    this.pincode = json['pincode']??"";
    this.state = json['state']??"";
    this.country = json['country']??"";
  }

  Map<String,dynamic> toJson()=>{
    "user_id": user_id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "dob": dob,
    "gender": gender,
    "address": address,
    "city": city,
    "pincode": pincode,
    "state": state,
    "country": country,
  };

}