

class Wallet{
  double totalBalance=0;
  int balanceDeposited=0;
  int winnings =0;
  int cashBonus =0;


  Wallet.fromJson(Map<String,dynamic> json){
    totalBalance = double.parse(json["balance"]??"0.0");
  }

  Wallet({
    this.totalBalance =0,
      this.balanceDeposited=0,
      this.winnings=0,
      this.cashBonus=0});

  copy({
    double? totalBalance,
    int? balanceDeposited,
    int? winnings,
    int? cashBonus
  }){
    return Wallet(
        totalBalance:totalBalance??this.totalBalance,
        balanceDeposited:balanceDeposited??this.balanceDeposited,
        winnings:winnings??this.winnings,
        cashBonus:cashBonus??this.cashBonus,
    );
  }




}