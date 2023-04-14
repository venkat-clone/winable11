

import 'package:flutter/cupertino.dart';
import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../models/CashFreeTransaction.dart';
import '../models/CashFreeTransactionResponse.dart';
import '../models/Wallet.dart';
import '../utils/value_notifiers.dart';

class WalletRepository{
  BaseApiServices _apiServices = NetworkAPIService();
  String _getUrl(String path)=>"https://admin.winable11.com/$path";

  /// should not be used in frontend since
  /// we should not use APP ID && SECRET KEY in frontend
  /// TODO remove this function from frontend
  Future<CashFreeTransactionResponse> createTransaction(CashFreeTransaction cashFreeTransaction) async{
   try{
     final jsonResponse = await _apiServices.getPostApiResponse(
       "https://sandbox.cashfree.com/pg/orders",
       cashFreeTransaction.toJson(),
       printJsonString: true,
       headers: {
         // APP ID
         "x-client-id":"3313457342502599d217f86278543133",
         // Secret ID
         "x-client-secret":"bce6c7ee6236d4b9ee21bc62f972756ada57c2e5",
         "x-api-version":"2022-09-01",
         "x-request-id":"frontend",
       },

     );
     print(jsonResponse);
     return CashFreeTransactionResponse.formJson(jsonResponse);

   }catch (e,s){
     debugPrintStack(stackTrace: s);
     throw e;
   }
  }

  Future<String> addCash(String amount) async {
    try{
      final userId = currentUser.value.user_id;
      final url = _getUrl('wallet/add/$userId/$amount');
      final result = await _apiServices.getGetApiResponse(url);
      currentWallet.value = await getWallet();
      return SharedPreferenceService.cridetCash(double.parse(amount));
    }catch(e,s){
      rethrow;
    }
  }


  Future<Wallet> getWallet() async{
    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("wallet/getwallectdetails/${currentUser.value.user_id}"));
      final newWallet = Wallet.fromJson(result["response"]);
      currentWallet.value  = newWallet;
      currentWallet.notifyListeners();
      return newWallet;
    }catch(e){
      rethrow;
    }
  }

}