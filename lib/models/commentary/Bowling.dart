class Bowling {
  Bowling({
      this.bowlingTeamTotalReview ="",
      this.bowlingTeamReviewSuccess ="",
      this.bowlingTeamReviewFailed ="",
      this.bowlingTeamReviewAvailable ="",});

  Bowling.fromJson(dynamic json) {
    bowlingTeamTotalReview = json['bowling_team_total_review'];
    bowlingTeamReviewSuccess = json['bowling_team_review_success'];
    bowlingTeamReviewFailed = json['bowling_team_review_failed'];
    bowlingTeamReviewAvailable = json['bowling_team_review_available'];
  }
  String bowlingTeamTotalReview ="";
  String bowlingTeamReviewSuccess ="";
  String bowlingTeamReviewFailed ="";
  String bowlingTeamReviewAvailable ="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bowling_team_total_review'] = bowlingTeamTotalReview;
    map['bowling_team_review_success'] = bowlingTeamReviewSuccess;
    map['bowling_team_review_failed'] = bowlingTeamReviewFailed;
    map['bowling_team_review_available'] = bowlingTeamReviewAvailable;
    return map;
  }

}