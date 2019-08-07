class Validator {
  static String validateEmail(String email) {
    if (email == null || email.trim() == "") return "Email required";
    var isValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!isValid) return "Email is invalid";
    return null;
  }

  static String validatePassword(String pass) {
    if (pass == null || pass.trim() == "")
      return "Pass required";
    else if (pass.length < 6) return "Pass require min 6 characters";
    return null;
  }
}
