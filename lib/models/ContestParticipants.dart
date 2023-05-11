/// id : "1"
/// user_Contestid : "17"
/// contest_type : "0"
/// userId : "8"
/// userContestName : "Hot Contest"
/// userWinners : null
/// userTotalteam : null
/// userJoinTeam : null
/// userEntry : "10"
/// userTotalWinners : null
/// userMatchid : "154"
/// publish : "0"
/// unique_code : null
/// createdDate : "2023-03-29 17:53:10"
/// modifiedDate : "2023-03-29 17:53:10"
/// payment_status : "1"
/// payment_type : "wallet"
/// team_status : "1"
/// userTeam_id : "0"

class ContestParticipants {
  ContestParticipants({
      this.id = '',
      this.userContestid = '',
      this.contestType = '',
      this.userId = '',
      this.userContestName = '',
      this.userWinners = '',
      this.userTotalteam = '',
      this.userJoinTeam = '',
      this.userEntry = '',
      this.userTotalWinners = '',
      this.userMatchid = '',
      this.publish = '',
      this.uniqueCode = '',
      this.createdDate = '',
      this.modifiedDate = '',
      this.paymentStatus = '',
      this.paymentType = '',
      this.teamStatus = '',
      this.userTeamId = '',});

  ContestParticipants.fromJson(Map<String,dynamic> json) {
    id = json['id'].toString()??'';
    userContestid = json['user_Contestid']??'';
    contestType = json['contest_type']??'';
    userId = json['userId']??'';

    name = json['name']??json['userId']??'';
    image = json['image']??'';
    userContestName = json['userContestName']??'';
    userWinners = json['userWinners']??'';
    userTotalteam = json['userTotalteam']??'';
    userJoinTeam = json['userJoinTeam']??'';
    userEntry = json['userEntry']??'';
    userTotalWinners = json['userTotalWinners']??'';
    userMatchid = json['userMatchid']??'';
    publish = json['publish']??'';
    uniqueCode = json['unique_code']??'';
    createdDate = json['createdDate']??'';
    modifiedDate = json['modifiedDate']??'';
    paymentStatus = json['payment_status']??'';
    paymentType = json['payment_type']??'';
    teamStatus = json['team_status']??'';
    userTeamId = json['userTeam_id']??'';
  }

  String id = "";
  String userContestid = "";
  String contestType = "";
  String userId = "";
  String name = "";
  String image = "";
  String userContestName = "";
  String userWinners = "";
  String userTotalteam = "";
  String userJoinTeam = "";
  String userEntry = "";
  String userTotalWinners = "";
  String userMatchid = "";
  String publish = "";
  String uniqueCode = "";
  String createdDate = "";
  String modifiedDate = "";
  String paymentStatus = "";
  String paymentType = "";
  String teamStatus = "";
  String userTeamId = "";


ContestParticipants copyWith({
  String? id,
  String? userContestid,
  String? contestType,
  String? userId,
  String? userContestName,
  String? userWinners,
  String? userTotalteam,
  String? userJoinTeam,
  String? userEntry,
  String? userTotalWinners,
  String? userMatchid,
  String? publish,
  String? uniqueCode,
  String? createdDate,
  String? modifiedDate,
  String? paymentStatus,
  String? paymentType,
  String? teamStatus,
  String? userTeamId,
}) => ContestParticipants(  id: id ?? this.id,
  userContestid: userContestid ?? this.userContestid,
  contestType: contestType ?? this.contestType,
  userId: userId ?? this.userId,
  userContestName: userContestName ?? this.userContestName,
  userWinners: userWinners ?? this.userWinners,
  userTotalteam: userTotalteam ?? this.userTotalteam,
  userJoinTeam: userJoinTeam ?? this.userJoinTeam,
  userEntry: userEntry ?? this.userEntry,
  userTotalWinners: userTotalWinners ?? this.userTotalWinners,
  userMatchid: userMatchid ?? this.userMatchid,
  publish: publish ?? this.publish,
  uniqueCode: uniqueCode ?? this.uniqueCode,
  createdDate: createdDate ?? this.createdDate,
  modifiedDate: modifiedDate ?? this.modifiedDate,
  paymentStatus: paymentStatus ?? this.paymentStatus,
  paymentType: paymentType ?? this.paymentType,
  teamStatus: teamStatus ?? this.teamStatus,
  userTeamId: userTeamId ?? this.userTeamId,
);


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_Contestid'] = userContestid;
    map['contest_type'] = contestType;
    map['userId'] = userId;
    map['userContestName'] = userContestName;
    map['userWinners'] = userWinners;
    map['userTotalteam'] = userTotalteam;
    map['userJoinTeam'] = userJoinTeam;
    map['userEntry'] = userEntry;
    map['userTotalWinners'] = userTotalWinners;
    map['userMatchid'] = userMatchid;
    map['publish'] = publish;
    map['unique_code'] = uniqueCode;
    map['createdDate'] = createdDate;
    map['modifiedDate'] = modifiedDate;
    map['payment_status'] = paymentStatus;
    map['payment_type'] = paymentType;
    map['team_status'] = teamStatus;
    map['userTeam_id'] = userTeamId;
    return map;
  }

}