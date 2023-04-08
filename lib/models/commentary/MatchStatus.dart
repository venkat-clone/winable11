

class MatchStatus{
  int status  =0;
  int gameStatus  =0;

  MatchStatus.fromJson(Map<String,dynamic> json){
    status = json['status']??0;
    gameStatus = json['game_state']??0;
  }
  toJson()=>{
    "status": status,
    "game_state": gameStatus
  };

  MatchStatus({this.status =0, this.gameStatus =0});
}