import 'package:flutter_stripe/src/utilities/validators.dart';
import 'package:test/test.dart';

// Test cases taken from
// https://github.com/exercism/problem-specifications/blob/master/exercises/luhn/canonical-data.json
void main () {
  luhnTests();
}

void luhnTests() {
  test('single digit is not Luhn valid', () {
    final actual = isLuhnValid('1');
    expect(actual, false);
  });

  test('0 is not Luhn valid', () {
    final actual = isLuhnValid('0');
    expect(actual, false);
  });

  test('simple reversible SIN is Luhn valid', () {
    final actual = isLuhnValid('059');
    expect(actual, true);
  });

  test('simple valid SIN is invalid when reversed', () {
    final actual = isLuhnValid('59');
    expect(actual, true);
  });

  test('valid Canadian SIN', () {
    final actual = isLuhnValid('055 444 285');
    expect(actual, true);
  });

  test('invalid Canadian SIN', () {
    final actual = isLuhnValid('055 444 286');
    expect(actual, false);
  });

  test('invalid credit card', () {
    final actual = isLuhnValid('8273 1232 7352 0569');
    expect(actual, false);
  });

  test('valid strings with non-digits are invalid', () {
    final actual = isLuhnValid('055a 444 285');
    expect(actual, false);
  });

  test('valid strings with punctuation are invalid', () {
    final actual = isLuhnValid('055-444-285');
    expect(actual, false);
  });

  test('valid strings with symbols are invalid', () {
    final actual = isLuhnValid('055£ 444\$ 285');
    expect(actual, false);
  });

  test('single zero with space is invalid', () {
    final actual = isLuhnValid(' 0');
    expect(actual, false);
  });

  test('multiple zeroes are valid', () {
    final actual = isLuhnValid('0000 0');
    expect(actual, true);
  });

  test('input digit 9 is correctly converted to output digit 9', () {
    final actual = isLuhnValid('091');
    expect(actual, true);
  });

  test('stripe test number is valid', () {
    final actual = isLuhnValid('4242424242424242');
    expect(actual, true);
  });
}