

import 'package:flutter/foundation.dart';

import '../utils/value_notifiers.dart';

class AppUser{
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
  String authId = "";
  String photo ="";

  int level = 0;
  int contests =0;
  int matches = 0;
  int wins =0;





  AppUser({
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

  AppUser.formJson(Map<String,dynamic> json){
    this.user_id = json['id']??"";
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
    this.photo = json['image']??'';
  }

  Map<String,dynamic> toJson()=>{
    "id": user_id,
    "name": name,
    "mobile": mobile.startsWith('+91')?mobile:'+91$mobile',
    "email": email,
    "dob": dob,
    "gender": gender,
    "address": address,
    "city": city,
    "pincode": pincode,
    "state": state,
    "country": country,
    "image":photo
  };


  getFirstLetter(){
    if(name.length<1)
      return "";
    else return name[0].toUpperCase();
  }
  Map<String,dynamic> toJsonForProfileUpdateDetails()=>{
    "user_id": currentUser.value.user_id,
    "address": address,
    "city": city,
    "pincode": pincode,
    "state": state,
    "country": country
  };

  get getAddress {

    String s = '';
    if(city.isNotEmpty) {
      s += (s.isNotEmpty?', ':' ') + city;
    }
    if(state.isNotEmpty) {
      s +=  (s.isNotEmpty?', ':' ') + state;
    }
    if(country.isNotEmpty) {
      s += (s.isNotEmpty?', ':' ') + country;
    }
    return s;
  }

  get isAddressPresent => (city+state+country+pincode+address).isNotEmpty;


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
})=>AppUser(
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
  );

}