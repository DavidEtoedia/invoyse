String? validateBusinessName(String? value) {
  const String pattern = r"^[.!#$%&'*+<>:;,%@()(/=?^_`{|}~-]";
  final RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "";
  }
  if (regex.hasMatch(value)) {
    return 'invalid';
  }
  return null;
}

String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (value!.length < 6) {
    return "";
  } else if (value.isEmpty) {
    return '';
  } else if (!regex.hasMatch(value)) {
    return '';
  } else {
    return null;
  }
}

String? validateUsername(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (value!.length < 9) {
    return "";
  } else if (value.isEmpty) {
    return '';
  } else if (!regex.hasMatch(value)) {
    return '';
  } else {
    return null;
  }
}

String? validateOTP(String? value) {
  if (value!.length != 4 || value.isEmpty) {
    return 'Must be 4 characters';
  }
  return null;
}

String? validateBvn(String? value) {
  if (value!.length < 11 || value.isEmpty) {
    return 'Must be 11 characters';
  }
  return null;
}

String? validateGeneric(String? value) {
  if (value!.isEmpty) {
    return '';
  }
  return null;
}

String? validateAccounNo(String? value) {
  if (value!.length < 10 || value.isEmpty) {
    return 'Must be 10 characters';
  }
  return null;
}

String? validateCode(String? value) {
  String newValue = removeWhiteSpaceAndDashes(value!);
  if (newValue.length != 9 || value.isEmpty) {
    return 'Must be 9 characters';
  }
  return null;
}

String? validateKey(String? value) {
  if (value!.length != 6 || value.isEmpty) {
    return 'Must be 6 characters';
  }
  return null;
}

String? validateBank(String? value) {
  if (value!.isEmpty) {
    return 'Select a bank';
  }
  return null;
}

String? validateAmountInput(String? value, String balance) {
  if (value == null || value.isEmpty) {
    return 'Amount must not be empty';
  }

  try {
    final inputAmount = _parseAmount(value);
    final availableBalanceAmount = _parseAmount(balance);

    if (inputAmount <= 0) {
      return 'Amount must be greater than 0';
    }

    if (inputAmount > availableBalanceAmount) {
      return 'Amount must not be more than available balance';
    }
  } catch (e) {
    return 'Invalid amount format';
  }

  return null;
}

num _parseAmount(String value) {
  return num.parse(value.replaceAll(',', ''));
}

String? validatePhoneNumber(String? value) {
  if (value!.length < 11 || value.isEmpty) {
    return 'Phone number must be 11 characters';
  }
  return null;
}

bool isStringOnlyDigits(String input) {
  return input.contains(RegExp(r'^\d*$'));
}

String removeWhiteSpaceAndDashes(String input) {
  return input.replaceAll(RegExp(r'\s|-'), '');
}
