enum STPCardBrand {
  Visa,
  Amex,
  MasterCard,
  Discover,
  JCB,
  DinersClub,
  Unknown
}

enum STPCardFundingType {
  Debit,
  Credit,
  Prepaid,
  Other
}

enum STPSourceFlow {
  None,
  Redirect,
  Verification,
  Receiver,
  Unknown
}

enum STPSourceStatus {
  Pending,
  Chargeable,
  Consumed,
  Canceled,
  Failed,
  Unknown
}

enum STPSourceType {
  Bancontact,
  Bitcoin,
  Card,
  Giropay,
  IDEAL,
  SEPADebit,
  Sofort,
  ThreeDSecure,
  Alipay,
  P24,
  Unknown
}

enum STPSourceUsage {
  Reusable,
  SingleUse,
  Unknown
}

enum STPSourceVerificationStatus {
  Pending,
  Succeeded,
  Failed,
  Unknown
}