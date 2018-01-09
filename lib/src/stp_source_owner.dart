import 'package:flutter_stripe/src/stp_address.dart';

class STPSourceOwner {
  STPAddress address;
  String email;
  String name;
  String phone;
  STPAddress verifiedAddress;
  String verifiedEmail;
  String verifiedName;
  String verifiedPhone;

  STPSourceOwner(
    {
      this.address,
      this.email,
      this.name,
      this.phone,
      this.verifiedAddress,
      this.verifiedEmail,
      this.verifiedName,
      this.verifiedPhone
    }
  );
}