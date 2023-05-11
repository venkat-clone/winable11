import 'dart:typed_data';

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/models/KYC.dart';
import 'package:http/http.dart' as http ;
import 'package:http_parser/http_parser.dart' show MediaType;


import 'package:newsports/utils/app_execptions.dart';
import 'package:newsports/utils/value_notifiers.dart';

import 'dart:io';
import '../base_classes/networkAPIService.dart';
import '../models/kycStatus.dart';
import '../utils/constants.dart';

class KYCRepository {

  BaseApiServices _apiService = NetworkAPIService();

  Future<KYCDetails> requestKYC(KYCDetails details,File aadhaar,File panCard) async {
    final String url = '${Constants.BaseUrl}user/register/kyc';
    final uri = Uri.parse('https://admin.winable11.com/user/register/kyc_image/${currentUser.value.user_id}');
    try {



      Uint8List aadhaarData = await aadhaar.readAsBytes();
      List<int> aadhaarList = aadhaarData.cast();

      // var aadhaarPic = http.MultipartFile.fromBytes('aadhar_upload', aadhaarList, filename: 'aadhar_upload.png');
      // request.files.add(aadhaarPic);
      // Uint8List panData = await aadhaar.readAsBytes();
      // List<int> panList = panData.cast();
      // var panPic = http.MultipartFile.fromBytes('pan_upload', panList, filename: 'pan_upload.png');
      // request.files.add(panPic);
      var request = http.MultipartRequest('POST', uri);

      print('Aashar path${aadhaar.path}');
      print('Pan path${aadhaar.path}');
      request.files.add(await http.MultipartFile.fromPath('aadhar_upload', aadhaar.path,filename: 'aadhar_upload.jpg'));
      request.files.add(await http.MultipartFile.fromPath('pan_upload', panCard.path,filename: 'pan_upload.jpg'));

      var response = await request.send();
      print('images uploaded to server');
      if(response.statusCode!=200){
        print("status Code ${response.statusCode}");
        print("url ${response.request?.url}");
        print("files ${response.request}");
        String responseBody = await response.stream.bytesToString();
        print("request responce ${responseBody}");
        throw InvalidInputException('failed to upload the images');
      }
      _apiService.getPostApiResponse(url, details.toJson());

    } on Exception catch (error) {
      print(error);
      rethrow ;
    }
    return KYCDetails();
  }

  Future<KYCStatus> kycStatus() async{
    try{
      // return KYCStatus(aadharStatus: "2",panStatus: "0");
      final result = await _apiService.getGetApiResponse("https://admin.winable11.com/User/doc_status/${currentUser.value.user_id}");
      return KYCStatus.fromJson(result['data']??{});
    }catch(e,s){
      print("$e/$s");
      rethrow;
    }
  }

}
