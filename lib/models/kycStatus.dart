
///  -1:Not applied
///    1:approved
///    0:Applied/Waiting to approve
///    2:rejected
class KYCStatus{

  static const notAppliedState = '0'; /// -1 >> 0
  static const pendingState = '1'; /// 0 >> 1
  static const approvedState = '2'; /// 1 >> 2
  static const rejectedState = '3'; /// 2 >> 3



  ///  0:Not applied
  ///    1:Applied/Pending
  ///    2:approved
  ///    3:rejected
  String aadharStatus = "-1";
  ///  0:Not applied
  ///   1:approved
  ///   2:Applied/Waiting to approve
  ///   3:rejected
  String panStatus = "-1";

  KYCStatus({this.aadharStatus = "-1", this.panStatus ="-1"});

  KYCStatus.fromJson(Map<String,dynamic> json){
    aadharStatus = json['aadhar_status']??'-1';
    panStatus =json['pan_status']??'-1';
  }

  toJson()=>{
    'aadhar_status':aadharStatus,
    'pan_status':panStatus
  };


  get requested => aadharStatus!=notAppliedState || panStatus!=notAppliedState;
  get rejected => aadharStatus==rejectedState || panStatus==rejectedState;
  get waiting => aadharStatus==pendingState && panStatus==pendingState;
  get verified => aadharStatus==approvedState && panStatus==approvedState;


  static String getString(String s,String name){
    print('status');
    switch(s) {
      case notAppliedState:
        return "You are not requested for $name verification";
      case approvedState:
        return "your $name has been verified";
      case pendingState:
        return "your $name is in progress";
      case rejectedState:
        return "your $name has been rejected";
      default:
        return '';
    }
      
  }


}