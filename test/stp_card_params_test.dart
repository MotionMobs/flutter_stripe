import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:test/test.dart';

STPCardParams cardParams() {
  final now = new DateTime.now();
  return new STPCardParams(
    "4242424242424242",
    now.month,
    now.year,
    cvc: "123",
    address: new STPAddress(postalCode: "12345")
  );
}

void main() {
  cardTests();
  expMonthTests();
  cvcTests();
  zipTests();
}

void cardTests() {
  test('valid card data is valid', () {
    var card = cardParams();
    final actual = card.isValid();
    expect(actual, true);
  });

  test('short card number is invalid', () {
    var card = cardParams();
    card.number = "424242424242";
    final actual = card.isValid();
    expect(actual, false);
  });

  test('long card number is invalid', () {
    var card = cardParams();
    // valid luhn number
    card.number = "42424242424242426";
    final actual = card.isValid();
    expect(actual, false);
  });
}

void expMonthTests() {
  test('zero month is invalid', () {
    var card = cardParams();
    card.expMonth = 0;
    expect(card.isValid(), false);
  });

  test('negative month is invalid', () {
    var card = cardParams();
    card.expMonth = -1;
    expect(card.isValid(), false);
  });

  test('current month is valid', () {
    var card = cardParams();
    expect(card.isValid(), true);
  });

  test('earlier month than now is invalid', () {
    var card = cardParams();
    final previousMonth = (card.expMonth + 10) % 12 + 1;
    if (previousMonth > card.expMonth) {
      card.expYear -= 1;
    }
    card.expMonth = previousMonth;
    expect(card.isValid(), false);
  });

  test('earlier year than now is invalid', () {
    var card = cardParams();
    card.expYear -= 1;
    expect(card.isValid(), false);
  });
}

void cvcTests() {
  test('null cvc is valid when not required', () {
    var card = cardParams();
    card.cvc = null;
    expect(card.isValid(cvcRequired: false), true);
  });

  test('null cvc is invalid when required', () {
    var card = cardParams();
    card.cvc = null;
    expect(card.isValid(cvcRequired: true), false);
  });

  test('short cvc is invalid', () {
    var card = cardParams();
    card.cvc = "12";
    expect(card.isValid(), false);
  });

  test('non-numeric characters make cvc invalid', () {
    var card = cardParams();
    card.cvc = "123a";
    expect(card.isValid(), false);
  });
}

void zipTests() {
  test('null zip is valid when not required', () {
    var card = cardParams();
    card.address.postalCode = null;
    expect(card.isValid(zipRequired: false), true);
  });

  test('null zip is invalid when required', () {
    var card = cardParams();
    card.address.postalCode = null;
    expect(card.isValid(zipRequired: true), false);
  });

  test('short zip is invalid', () {
    var card = cardParams();
    card.address.postalCode = "1234";
    expect(card.isValid(), false);
  });

  test('long zip is invalid', () {
    var card = cardParams();
    card.address.postalCode = "123456";
    expect(card.isValid(), false);
  });

  test('non-numeric characters make zip invalid', () {
    var card = cardParams();
    card.address.postalCode = "1234a";
    expect(card.isValid(), false);
  });
}