import 'package:flutter_stripe/src/stp_address.dart';

class STPCustomer {
  String stripeID;
  String defaultSource;
  List<String> sources;
  STPAddress shippingAddress;

  STPCustomer(
    this.stripeID,
    this.sources,
    {
      this.defaultSource,
      this.shippingAddress
    }
  );
}