

import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/repository/wallet_repoditory.dart';
import 'package:newsports/utils/value_notifiers.dart';

import '../models/Winnings.dart';
import '../utils/app_execptions.dart';

class ContestRepository{
  final _apiServices = NetworkAPIService();
  String _getUrl(String path) => "https://admin.winable11.com/$path";

  Future<List<Contest>> getContests(String matchId) async{


    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("default_contest/get_contest_list/$matchId"));
      List<Contest> contestList = [];

      _apiServices.typeCast<List<dynamic>>(result['response']).forEach((element) {
        contestList.add(Contest.fromJson(element));
      });
      return contestList;
    }
    catch(e,s){
      print(e);
      print(s);
      rethrow;
    }
  }

  Future joinCricketContest(String contestId,String teamId,String type) async{
    try{
      await _apiServices.getPostApiResponse(_getUrl("default_contest/user_join/join"),{
        "contest_id":contestId,
        "user_id":currentUser.value.user_id,
        "team_id":teamId,
        "type":type
      });
      final walletRepository = WalletRepository();
      currentWallet.value = await walletRepository.getWallet();

    }catch(e){
      rethrow;
    }
  }

  Future<List<Winning>> getWinnings(String contestId) async{
    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("default_contest/winnig_information_get/$contestId"));
      List<Winning>  winnings = [];
      _apiServices.typeCast<List<dynamic>>(result['data']).forEach((element) {
        winnings.add(Winning.fromJson(element));
      });
      return winnings;
    }catch(e){
      rethrow;
    }
  }

}