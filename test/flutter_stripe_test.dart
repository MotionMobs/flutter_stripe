import 'dart:async';
import 'dart:io';
import 'package:test/test.dart';

import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  test('requests token successfully', () async {
    Map<String, String> envVars = Platform.environment;
    final client = new STPApiClient(envVars['STRIPE_KEY']);
    final card = new STPCardParams(
      '4242424242424242',
      01,
      2019,
      cvc: '123',
      address: new STPAddress(
        line1: "123 Test St",
        city: "Somewhere",
        state: "CA",
        postalCode: "11111",
      )
    );

    final token = await client.createTokenWithCard(card);
    expect(token is STPToken, true);
  });
}
