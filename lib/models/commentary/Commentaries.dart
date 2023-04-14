import 'CommentryBatsmen.dart';
import 'CommentryBowlers.dart';

class Commentaries {
  Commentaries({
  this.eventId = "",
  this.event = "",
  this.batsmanId = "",
  this.bowlerId = "",
  this.over = "",
  this.ball = "",
  this.score ="0",
  this.commentary ="",
  this.noballDismissal= false,
  this.text = "",
  this.timestamp =0,
  this.run =0,
  this.noballRun ="",
  this.wideRun ="",
  this.byeRun ="",
  this.legbyeRun ="",
  this.batRun ="",
  this.noball = false,
  this.wideball = false,
  this.six = false,
  this.four = false,
  required this.batsmen ,
  required this.bowlers ,
  });

  Commentaries.fromJson(dynamic json) {
    eventId = json['event_id']??"";
    event = json['event']??"";
    batsmanId = json['batsman_id']??"";
    bowlerId = json['bowler_id']??"";
    over = (json['over']??"").toString();
    ball = (json['ball']??"").toString();
    score = (json['score']??0).toString();
    commentary = json['commentary']??"";
    noballDismissal = json['noball_dismissal']??false;
    text = json['text']??"";
    timestamp = json['timestamp']??0;
    run = json['run']??json['runs']??0;
    noballRun = json['noball_run']??"";
    wideRun = json['wide_run']??"";
    byeRun = json['bye_run']??"";
    legbyeRun = json['legbye_run']??"";
    batRun = json['bat_run']??"";
    noball = json['noball']?? false;
    wideball = json['wideball']?? false;
    six = json['six']?? false;
    four = json['four']?? false;
    if (json['batsmen'] != null) {
      batsmen = [];
      json['batsmen'].forEach((v) {
        batsmen.add(Batsmen.fromJson(v));
      });
    }
    if (json['bowlers'] != null) {
      bowlers = [];
      json['bowlers'].forEach((v) {
        bowlers.add(Bowlers.fromJson(v));
      });
    }
  }
  String eventId = "";
  String event = "";
  String batsmanId = "";
  String bowlerId = "";
  String over = "";
  String ball = "";
  String score ="0";
  String commentary ="";
  bool noballDismissal= false;
  String text = "";
  int timestamp =0;
  int run =0;
  String noballRun ="";
  String wideRun ="";
  String byeRun ="";
  String legbyeRun ="";
  String batRun ="";
  bool noball = false;
  bool wideball = false;
  bool six = false;
  bool four = false;
  List<Batsmen> batsmen =[];
  List<Bowlers> bowlers =[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_id'] = eventId;
    map['event'] = event;
    map['batsman_id'] = batsmanId;
    map['bowler_id'] = bowlerId;
    map['over'] = over;
    map['ball'] = ball;
    map['score'] = score;
    map['commentary'] = commentary;
    map['noball_dismissal'] = noballDismissal;
    map['text'] = text;
    map['timestamp'] = timestamp;
    map['run'] = run;
    map['noball_run'] = noballRun;
    map['wide_run'] = wideRun;
    map['bye_run'] = byeRun;
    map['legbye_run'] = legbyeRun;
    map['bat_run'] = batRun;
    map['noball'] = noball;
    map['wideball'] = wideball;
    map['six'] = six;
    map['four'] = four;
    if (batsmen != null) {
      map['batsmen'] = batsmen.map((v) => v.toJson()).toList();
    }
    if (bowlers != null) {
      map['bowlers'] = bowlers.map((v) => v.toJson()).toList();
    }
    return map;
  }

}