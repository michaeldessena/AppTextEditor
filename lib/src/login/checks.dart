bool isPasswordFormatOk(String password) {
  //  r'^
  //  (?=.*[A-Z])       // should contain at least one upper case
  //  (?=.*[a-z])       // should contain at least one lower case
  //  (?=.*?[0-9])      // should contain at least one digit
  //  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  //  .{8,}             // Must be at least 8 characters in length
  //  $

  RegExp regexp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (!regexp.hasMatch(password)) {
    return false;
  } else {
    return true;
  }
}

bool isEmailValid(String email) {
  RegExp regexp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  if (!regexp.hasMatch(email)) {
    return false;
  } else {
    return true;
  }
}
