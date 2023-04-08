

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
    // await Future.delayed(Duration(seconds: 2));
    if(false){
      return [
      Contest(
          contestName: "Hot Contest",
          contestTag: "Get ready for mega winnings!",
          winners: "10",
          prizePool: "50",
          totalTeam: "20",
          joinTeam: "0",
          entry: "10",
          contestDescription: "As per government regulations, a tax of 31.2% will be deducted, If a Player winnings is more than Rs. 10,000.",
          contestNote1: "Winnings are confirmed even if this contest doesn't fill up",
          contestNote2: "In this multi-entry contest, join with up to 6 teams"
      ),
        Contest(
          contestName: "Practice Contest",
          contestTag: "Get ready for mega winnings!",
          winners: "25",
          prizePool: "1000000",
          totalTeam: "50",
          joinTeam: "0",
          entry: "10",
          contestDescription: "The actual prize money may be different than the prize money mentioned above if there is a tie for any of the winning positions. Check FAQs for further details . As per government regulations, a tax of 31.2% will be deducted.",
          contestNote1: "Winnings are confirmed even if this contest doesn't fill up",
          contestNote2: "In this multi-entry contest, join with up to 6 teams"
      ),
      ];
    }

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

  Future joinCricketContest(String contestId,String teamId) async{
    try{
      await _apiServices.getPostApiResponse(_getUrl("default_contest/user_join/join"),{
        "contest_id":contestId,
        "user_id":currentUser.value.user_id,
        "user_team_id":teamId
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