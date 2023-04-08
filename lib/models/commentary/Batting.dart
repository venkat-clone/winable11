class Batting {
  Batting({
      this.battingTeamTotalReview ="",
      this.battingTeamReviewSuccess ="",
      this.battingTeamReviewFailed ="",
      this.battingTeamReviewAvailable ="",});

  Batting.fromJson(dynamic json) {
    battingTeamTotalReview = json['batting_team_total_review'];
    battingTeamReviewSuccess = json['batting_team_review_success'];
    battingTeamReviewFailed = json['batting_team_review_failed'];
    battingTeamReviewAvailable = json['batting_team_review_available'];
  }
  String battingTeamTotalReview = "";
  String battingTeamReviewSuccess = "";
  String battingTeamReviewFailed = "";
  String battingTeamReviewAvailable = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['batting_team_total_review'] = battingTeamTotalReview;
    map['batting_team_review_success'] = battingTeamReviewSuccess;
    map['batting_team_review_failed'] = battingTeamReviewFailed;
    map['batting_team_review_available'] = battingTeamReviewAvailable;
    return map;
  }

}