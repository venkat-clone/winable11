
import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Team.dart';

class TeamRepository {
  BaseApiServices apiServices = NetworkAPIService();
  String _getUrl(String path)=>"https://admin.winable11.com/$path";

  Future<List<Team>> getAllTeams() async {
    try{
      final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Team/getTeam"));
      List<Team> list = [];
      (jsonResponse['response'] as List<dynamic>).forEach((element) {
        list.add(Team.fromJson(element));
      });
      return list;
    }catch (e){
      throw e;
    }
  }

}
