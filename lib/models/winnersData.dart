

class WinnersData{
  String userId = "";
  String userName = "";
  String teamId = "";
  String image = "";
  int winningAmount = 0;
  int rank = 0;

  WinnersData({
    this.userId = "",
    this.userName = "",
    this.teamId = "",
    this.image = "",
    this.winningAmount = 0,
    this.rank = 0
  });

  WinnersData.fromJson(Map<String,dynamic> json){
    userId = json['user_id']??"";
    userName = json['user_name']??"";
    teamId = json['team_id']??"";
    image = json['image']??"";
    winningAmount = json['winningAmount']??0;
    rank = json['rank']??0;
  }
}