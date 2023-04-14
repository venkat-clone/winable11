import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mime/mime.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/models/KYC.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../repository/kyc_repository.dart';
import '../utils/app_execptions.dart';

class KYCController extends BaseController {
  Future requestForKYC(BuildContext context,KYCDetails details,File aadhaar,File panCard) async {
    bool ans = false;
    await lodeWhile(() async{
      try{
        // SharedPreferenceService.setKYC(true);
        final result =  await KYCRepository.requestKYC(details,aadhaar,panCard);
        ans = true;
        successSnackBar("Uploaded your kyc details", context);
        SharedPreferenceService.setKYC(true);
      } on FileNotUploadedException catch(e){
        errorSnackBar(e.getMessage()+" please try again", context);
      } catch(e,s){

      }

    });
    return ans;
    // details.PanCardIMAGE =
    //     "https://w7.pngwing.com/pngs/157/146/png-transparent-pan-card.png";
    // details.AadharImage =
    //     "https://e7.pngegg.com/pngimages/745/620/png-clipart-aadhaar-targeted-delivery-of-financial-and-other-subsidies-benefits-and-services-act-2016-paper-card-printer-national-payments-corporation-of-india-pvc-card-miscellaneous-ribbon.png";
  }


  upLoadFile(File file,String path,String name) async{
    UploadTask uploadTask;
    Reference ref = await FirebaseStorage.instance.ref().child(path).child(name);
    final metadata = SettableMetadata(
      contentType: lookupMimeType(file.path),
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }

  setKYCStatus(authID, status) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .get()
          .then((value) async {
        if (value.exists) {
          getKYCStatus(authID);
        } else {
          await FirebaseFirestore.instance.collection("user").doc(authID).set(
              {"kycStatus": status}).whenComplete(() => getKYCStatus(authID));
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getKYCStatus(authID) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .get()
          .then((value) =>
          SharedPreferenceService.setKYC(value.data()!['kycStatus']));
    } catch (e) {}
  }

  upDateKYCStatus(authID, status) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(authID)
          .update({"kycStatus": status})
          .onError((error, stackTrace) => print(error))
          .whenComplete(() => getKYCStatus(authID));
    } catch (e) {}
  }


}
