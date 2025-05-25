bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );
  return emailRegExp.hasMatch(email);
}

bool isLongEnough(String password) {
  return password.length > 6;
}

bool hasNumber(String password) {
  final RegExp numberRegExp = RegExp(r'\d');
  return numberRegExp.hasMatch(password);
}
