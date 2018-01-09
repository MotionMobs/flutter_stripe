enum STPCardBrand {
  Visa,
  Amex,
  MasterCard,
  Discover,
  JCB,
  DinersClub,
  Unknown
}

STPCardBrand cardBrandFromString(String brandName) {
  switch (brandName) {
    case 'Visa':
      return STPCardBrand.Visa;
      break;
    case 'American Express':
      return STPCardBrand.Amex;
      break;
    case 'MasterCard':
      return STPCardBrand.MasterCard;
      break;
    case 'JCB':
      return STPCardBrand.JCB;
      break;
    case 'Diners Club':
      return STPCardBrand.DinersClub;
      break;
    default:
      return STPCardBrand.Unknown;
  }
}

enum STPCardFundingType {
  Credit,
  Debit,
  Prepaid,
  Unknown
}

STPCardFundingType cardFundingTypeFromString(String brandName) {
  switch (brandName) {
    case 'Credit':
      return STPCardFundingType.Credit;
      break;
    case 'Debit':
      return STPCardFundingType.Debit;
      break;
    case 'Prepaid':
      return STPCardFundingType.Prepaid;
      break;
    default:
      return STPCardFundingType.Unknown;
  }
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