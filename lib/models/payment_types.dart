
abstract class PaymentType{
  String get type;
}

class Wallet extends PaymentType{
  @override
  String get type => "Wallet";

}
class UPI extends PaymentType{
  @override
  String get type => "UPI";

}
