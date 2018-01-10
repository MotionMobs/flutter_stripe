bool isLuhnValid(String number) {
  // remove spaces
  number = number.replaceAll(" ", '');

  // guard against obvious false cases
  if (number.length < 2 || number.contains(new RegExp(r"\D"))) {
    return false;
  }

  // get reversed list of numbers
  final numbers = number.split('').reversed.toList();
  int sum = 0;
  for (var i = 0; i < numbers.length; i++) {
    var digit = int.parse(numbers[i]);
    if (i % 2 != 0) {
      digit = digit * 2;
      if (digit > 9) {
        digit = digit - 9;
      }
    }
    sum += digit;
  }

  return sum % 10 == 0;
}

