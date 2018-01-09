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
    this.number,
    this.expMonth,
    this.expYear,
    {
      this.cvc,
      this.name,
      this.currency: 'usd',
      this.address
    }
  );

  Map<String, Object> toMap() {
    var map = {
      "number": number,
      "exp_month": expMonth,
      "exp_year": expYear,
      "cvc": cvc,
      "name": name,
      "currency": currency,
    };

    if (address != null) {
      map["address_line1"] = address.line1;
      map["address_line2"] = address.line2;
      map["address_city"] = address.city;
      map["address_state"] = address.state;
      map["address_zip"] = address.postalCode;
      map["address_country"] = address.country;
    }

    var deleteKeys = [];
    map.forEach((key, value) {
      if (value == null) {
        deleteKeys.add(key);
      };
    });

    for (var key in deleteKeys) {
      map.remove(key);
    }

    return map;
  }
}