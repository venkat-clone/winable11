

class Winning{
  String rank ="";
  String contest = "";
  String price = "";
  Winning({
    this.rank ="", this.price="",
    this.contest = ""
  });

  Winning.fromJson(Map<String,dynamic> json){
    rank = json["rank"];
    contest = json["contest_id"];
    price = json["price"];
  }
}