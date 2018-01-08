import 'package:flutter_stripe/src/stp_enums.dart';

class STPSourceVerification {
  int attemptsRemaining;
  STPSourceVerificationStatus status;

  STPSourceVerification(this.status, {this.attemptsRemaining});
}