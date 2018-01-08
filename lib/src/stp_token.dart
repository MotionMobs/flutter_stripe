import 'package:flutter_stripe/src/stp_card.dart';

class STPToken {
  String stripeID;
  String tokenID;
  bool livemode;
  STPCard card;
  // TODO: STPBankAccount bankAccount;
  DateTime created;

  STPToken(
    this.stripeID,
    this.tokenID,
    this.livemode,
    {
      this.card,
      // TODO: this.bankaccount,
      this.created
    }
  );
}