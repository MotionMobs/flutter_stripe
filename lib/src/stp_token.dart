import 'package:flutter_stripe/src/stp_address.dart';
import 'package:flutter_stripe/src/stp_card.dart';
import 'package:flutter_stripe/src/stp_enums.dart';

class STPToken {
  String id;
  bool livemode;
  STPCard card;
  // TODO: STPBankAccount bankAccount;
  DateTime created;

  STPToken(
    this.id,
    this.livemode,
    {
      this.card,
      // TODO: this.bankaccount,
      this.created
    }
  );

  STPToken.fromMap(Map map) {
    id = map["id"];
    livemode = map["livemode"];
    if (card != null && card is Map) {
      final cardData = map["card"];
      card = new STPCard(
        cardData["id"],
        cardData["last4"],
        cardData["expMonth"],
        cardData["expYear"],
        new STPAddress(
          line1: cardData["address_line1"],
          line2: cardData["address_line2"],
          city: cardData["address_city"],
          state: cardData["address_state"],
          postalCode: cardData["address_zip"],
          country: cardData["address_country"]
        ),
        cardBrandFromString(map["card"]["brand"]),
        cardFundingTypeFromString(map["card"]["funding"]),
      );
    }
    created = new DateTime.fromMillisecondsSinceEpoch(map["created"] * 1000);
  }
}