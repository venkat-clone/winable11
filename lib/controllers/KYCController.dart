import 'dart:io';



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mime/mime.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/base_classes/value_state.dart';
import 'package:newsports/models/KYC.dart';
import 'package:newsports/models/kycStatus.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../repository/kyc_repository.dart';
import '../utils/app_execptions.dart';

class KYCController extends BaseController {


  KYCRepository _repository = KYCRepository();

  ValueState<KYCStatus> kycStatus = ValueState.loading();


  Future requestForKYC(BuildContext context,KYCDetails details,File aadhaar,File panCard) async {
    bool ans = false;
    await lodeWhile(() async{
      try{
        // SharedPreferenceService.setKYC(true);
        final result =  await _repository.requestKYC(details,aadhaar,panCard);
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






  getKYCStatus(BuildContext context) async {
    try {
      final result = await _repository.kycStatus();
      setState(() {
        kycStatus = ValueState(value: result);
      });
    } catch (e) {
      print(e);
      kycStatus = ValueState(error: 'Unexpected error occurred');
      errorSnackBar("unExpected Error occurred", context);
    }
  }



}
