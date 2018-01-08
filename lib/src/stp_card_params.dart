import 'stp_address.dart';

class STPCardParams {
  String number;
  int expMonth;
  int expYear;
  String cvc;
  String name;
  String currency;
  STPAddress address;

  STPCardParams(
    this.expMonth,
    this.expYear,
    {
      this.number,
      this.cvc,
      this.name,
      this.currency: 'usd',
      this.address
    }
  );
}