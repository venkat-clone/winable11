

class UserRank{
  String id = '';
  String name = '';
  String teamId = '';
  String image = '';
  String rank = '';
  String points = '';
  String teamName = '';

  UserRank.fromJson(Map<String,dynamic> json){
    id = json['user_id']??'';
    name = json['user_name']??'';
    teamId = json['team_id']??'';
    image = json['image']??'';
    rank = (json['rank']??'').toString();
    points = json['points']??'';
    teamName = json['user_team_name']??'';
  }


}