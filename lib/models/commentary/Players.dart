class Players {
  Players({
      this.pid =0 ,
      this.title= "",
      this.shortName= "",
      this.firstName= "",
      this.lastName= "",
      this.middleName= "",
      this.birthdate= "",
      this.birthplace= "",
      this.country= "",
      // required this.primaryTeam,
      this.logoUrl= "",
      this.playingRole= "",
      this.battingStyle= "",
      this.bowlingStyle= "",
      this.fieldingPosition= "",
    this.recentMatch =0,
    this.recentAppearance =0,
    this.fantasyPlayerRating =0,
      this.altName= "",
      this.facebookProfile= "",
      this.twitterProfile= "",
      this.instagramProfile= "",
      this.debutData= "",
      this.thumbUrl= "",
      this.nationality= "",
      this.role= "",
      this.roleStr= "",});

  Players.fromJson(dynamic json) {
    pid = json['pid'];
    title = json['title'];
    shortName = json['short_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    birthdate = json['birthdate'];
    birthplace = json['birthplace'];
    country = json['country'];
    // if (json['primary_team'] != null) {
    //   primaryTeam = [];
    //   json['primary_team'].forEach((v) {
    //     primaryTeam.add(Dynamic.fromJson(v));
    //   });
    // }
    logoUrl = json['logo_url'];
    playingRole = json['playing_role'];
    battingStyle = json['batting_style'];
    bowlingStyle = json['bowling_style'];
    fieldingPosition = json['fielding_position'];
    recentMatch = json['recent_match'];
    recentAppearance = json['recent_appearance'];
    fantasyPlayerRating = json['fantasy_player_rating'];
    altName = json['alt_name'];
    facebookProfile = json['facebook_profile'];
    twitterProfile = json['twitter_profile'];
    instagramProfile = json['instagram_profile'];
    debutData = json['debut_data'];
    thumbUrl = json['thumb_url'];
    nationality = json['nationality'];
    role = json['role'];
    roleStr = json['role_str'];
  }
  int pid =0;
  String title = "";
  String shortName = "";
  String firstName = "";
  String lastName = "";
  String middleName = "";
  String birthdate = "";
  String birthplace = "";
  String country = "";
  List<dynamic> primaryTeam = [];
  String logoUrl = "";
  String playingRole = "";
  String battingStyle = "";
  String bowlingStyle = "";
  String fieldingPosition = "";
  int recentMatch =0;
  int recentAppearance =0;
  double fantasyPlayerRating =0;
  String altName = "";
  String facebookProfile = "";
  String twitterProfile = "";
  String instagramProfile = "";
  String debutData = "";
  String thumbUrl = "";
  String nationality = "";
  String role = "";
  String roleStr = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = pid;
    map['title'] = title;
    map['short_name'] = shortName;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['middle_name'] = middleName;
    map['birthdate'] = birthdate;
    map['birthplace'] = birthplace;
    map['country'] = country;
    if (primaryTeam != null) {
      map['primary_team'] = primaryTeam.map((v) => v.toJson()).toList();
    }
    map['logo_url'] = logoUrl;
    map['playing_role'] = playingRole;
    map['batting_style'] = battingStyle;
    map['bowling_style'] = bowlingStyle;
    map['fielding_position'] = fieldingPosition;
    map['recent_match'] = recentMatch;
    map['recent_appearance'] = recentAppearance;
    map['fantasy_player_rating'] = fantasyPlayerRating;
    map['alt_name'] = altName;
    map['facebook_profile'] = facebookProfile;
    map['twitter_profile'] = twitterProfile;
    map['instagram_profile'] = instagramProfile;
    map['debut_data'] = debutData;
    map['thumb_url'] = thumbUrl;
    map['nationality'] = nationality;
    map['role'] = role;
    map['role_str'] = roleStr;
    return map;
  }

}