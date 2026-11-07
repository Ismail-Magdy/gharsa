class AppRegex {
  // Private constructor to prevent creating objects from this class
  AppRegex._();

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static final RegExp _passwordRegExp = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
  );
  static final RegExp _phoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  static final RegExp _lowerCaseRegExp = RegExp(r'^(?=.*[a-z])');
  static final RegExp _upperCaseRegExp = RegExp(r'^(?=.*[A-Z])');
  static final RegExp _numberRegExp = RegExp(r'^(?=.*?[0-9])');
  static final RegExp _specialCharRegExp = RegExp(r'^(?=.*?[@$!%*?&])');

  static bool isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return _phoneRegExp.hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return _lowerCaseRegExp.hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return _upperCaseRegExp.hasMatch(password);
  }

  static bool hasNumber(String password) {
    return _numberRegExp.hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return _specialCharRegExp.hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return password.length >= 8;
  }
}
