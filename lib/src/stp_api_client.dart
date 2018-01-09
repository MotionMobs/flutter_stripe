import 'dart:async';
import 'package:flutter_stripe/src/stp_card_params.dart';
import 'package:flutter_stripe/src/stp_token.dart';
import 'package:flutter_stripe/src/stp_service.dart';

class STPApiClient {
  String publishableKey;

  STPApiClient(this.publishableKey);

  /// Returns an STPToken object using the Stripe API
  /// borrowing from
  /// https://gitlab.com/exitlive/stripe-dart/blob/master/lib/src/service.dart
  Future<STPToken> createTokenWithCard(STPCardParams card) async {
    var endpoint = '/tokens';
    var data = {'card': card.toMap()};
    var tokenJSON = await STPService.postRequest(endpoint, data, publishableKey);
    var token = new STPToken.fromMap(tokenJSON);
    return token;
  }
}