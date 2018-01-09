import 'package:flutter_stripe/src/stp_enums.dart';
import 'package:flutter_stripe/src/stp_source_owner.dart';
import 'package:flutter_stripe/src/stp_source_verification.dart';

class STPSource {
  String stripeID;
  int amount;
  String clientSecret;
  DateTime created;
  String currency;
  STPSourceFlow flow;
  bool livemode;
  Map<String, String> metadata;
  STPSourceOwner owner;
  // TODO: STPSourceReceiver receiver;
  // TODO: STPSourceRedirect redirect;
  STPSourceStatus status;
  STPSourceType type;
  STPSourceUsage usage;
  STPSourceVerification verification;
  Map<Object, Object> details;
  // TODO: STPSourceCardDetails details;
  // TODO: STPSourceSEPADebitDetails sepaDebitDetails;

  STPSource(
    this.stripeID,
    this.flow,
    this.livemode,
    this.status,
    this.type,
    this.usage,
    {
      this.amount,
      this.clientSecret,
      this.created,
      this.currency,
      this.metadata,
      this.verification,
      this.details
    }
  );
}