import 'package:flutter_stripe/src/utilities/validators.dart';
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

  bool isValid({bool cvcRequired = false, bool zipRequired = false}) {
    return _hasValidNumber()
      && _hasValidExpMonth()
      && _hasValidCVC(cvcRequired)
      && _hasValidZip(zipRequired);
  }

  bool _hasValidNumber() {
    bool lengthValid = number.length >= 13 && number.length <= 16;
    return isLuhnValid(number) && lengthValid;
  }

  bool _hasValidExpMonth() {
    bool validRange = 1 <= expMonth && expMonth <= 12;
    final now = new DateTime.now();
    bool currentMonthOrLater = (now.year < expYear || (expYear == now.year && now.month <= expMonth));
    return validRange && currentMonthOrLater;
  }

  bool _hasValidCVC(bool required) {
    if (cvc != null) {
      return _meetsMinLength(cvc, 3) && _onlyDigits(cvc);
    } else if (required) {
      return false;
    }
    return true;
  }

  bool _hasValidZip(bool required) {
    if (address != null && address.postalCode != null) {
      return _meetsMinLength(address.postalCode, 5)
        && _onlyDigits(address.postalCode)
        && address.postalCode.length <= 5;
    } else if (required) {
      return false;
    }
    return true;
  }

  bool _meetsMinLength(value, int length) {
    return value.length >= length;
  }

  bool _onlyDigits(value) {
    return !value.contains(new RegExp(r"\D"));
  }
}