import 'Batting.dart';
import 'Bowling.dart';

class Review {
  Review({
      required this.batting,
      required this.bowling,
  });

  Review.fromJson(dynamic json) {
    batting = Batting.fromJson(json['batting']??{});
    bowling = Bowling.fromJson(json['bowling']??{});
  }
  Batting batting = Batting();
  Bowling bowling = Bowling();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (batting != null) {
      map['batting'] = batting.toJson();
    }
    if (bowling != null) {
      map['bowling'] = bowling.toJson();
    }
    return map;
  }

}