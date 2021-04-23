class ValidationHelper {
  static const String emailRegex =
      r"/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g";

  static String validateEmailAddress(String emailAddress) {
    if (emailAddress.isEmpty) {
      return 'Email Address cannot be empty';
    }
    bool _isValid = RegExp(emailRegex).hasMatch(emailAddress);
    if (_isValid) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String validatePassword(String password) {
    if (password.length <= 6 || !password.contains(RegExp('[A-Z]'))) {
      return '6+ Characters, 1 Capital letter, 1 Number';
    } else {
      return null;
    }
  }
}
