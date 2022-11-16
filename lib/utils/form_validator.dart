/*class FormValidator {
  static String? validatePhoneNumber(String? phoneNumber, String a) {
    final RegExp phoneNumberRegex = RegExp(
        r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$",
        caseSensitive: false,
        multiLine: false);
    //Todo this could be part of the cubit if we want to
    // or part of an utility class
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Please enter a phone number";
    } else if (!phoneNumberRegex.hasMatch(phoneNumber)) {
      return "Please enter valid phone number";
    }
    return null;
  }
}*/
