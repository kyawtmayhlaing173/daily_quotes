mixin InputValidationMixin {
  String? isUserNameValid({required String userName}) {
    if (userName.isEmpty) return "User Name should not be empty";
    return null;
  }

  String? isPasswordValid({required String password}) {
    RegExp pattern = RegExp(
        "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$");

    if (password.isEmpty) {
      return "Password should not be empty";
    } else if (!pattern.hasMatch(password)) {
      return "Password must contain\n - Minimum 1 Upper case\n - Minimum 1 Lowercase\n - Minimum 1 Numeric Number\n - Minimum 1 Special Character\n - Common Allow Character ( ! @ # \$ & * ~ )";
    } else {
      return null;
    }
  }

  String? isEmailValid({required String email}) {
    RegExp pattern = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty) {
      return "Email should not be empty";
    } else if (!pattern.hasMatch(email)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }
}
