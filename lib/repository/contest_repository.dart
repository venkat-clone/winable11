

import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/repository/wallet_repoditory.dart';
import 'package:newsports/utils/value_notifiers.dart';

import '../models/ContestParticipants.dart';
import '../models/UserRank.dart';
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
        contestList.add(Contest.fromJsonWith(element,matchId));
      });
      return contestList;
    }
    catch(e,s){
      print(e);
      print(s);
      rethrow;
    }
  }

  Future<List<Contest>> getMyContests(String matchId) async{


    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("user/contests/${currentUser.value.user_id}/$matchId"));
      // final result = await _apiServices.getGetApiResponse(_getUrl("user/contests/79/1170"));
      List<Contest> contestList = [];

      _apiServices.typeCast<List<dynamic>>(result['data']).forEach((element) {
        contestList.add(Contest.fromJsonWith(element,matchId));
      });
      return contestList;
    }
    catch(e,s){
      print(e);
      print(s);
      rethrow;
    }
  }

  Future joinCricketContest(Contest contest,String teamId) async{
    try{
      await _apiServices.getPostApiResponse(_getUrl("default_contest/user_join/join"),{
        "contest_id":contest.contestId,
        "user_id":currentUser.value.user_id,
        "team_id":teamId,
        "contest_type":contest.type,
        "match_id":contest.matchId,
        "payment_type":"wallet",
        "payment_status" : "1",
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

  Future<List<ContestParticipants>> getContestParticipants(String matchId,String contestId,String contestType) async{
    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("user/get_participants/$matchId/$contestId/$contestType"));
      List<ContestParticipants> contestParticipant = [];
      ((result['data']??[]) as List<dynamic>).forEach((e){
        contestParticipant.add(ContestParticipants.fromJson(e));
      });

      return contestParticipant;
    }catch(e,s){
      print("$e\n$s");
      rethrow;
    }
  }

  Future<List<UserRank>> getUserRanks(String matchId,String contestId,String contestType) async{
    try{
      final result = await _apiServices.getGetApiResponse(_getUrl("user/get_participants/$matchId/$contestId/$contestType"));

      List<UserRank> list = [];
      ((result['data']??[]) as List<dynamic>).forEach((e){
        list.add(UserRank.fromJson(e));
      });

      return list;
    }catch(e,s){
      rethrow;
    }
  }


}