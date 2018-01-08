import 'package:flutter_stripe/src/stp_address.dart';
import 'package:flutter_stripe/src/stp_enums.dart';

class STPCard {
  String stripeID;
  String last4;
  int expMonth;
  int expYear;
  String name;
  STPAddress address;
  STPCardBrand brand;
  STPCardFundingType funding;
  String country;
  String currency;
  Map<String, String> metadata;

  STPCard(
    this.stripeID,
    this.last4,
    this.expMonth,
    this.expYear,
    this.address,
    this.brand,
    this.funding,
    {
      this.name,
      this.country: 'US',
      this.currency,
      this.metadata
    }
  );
}