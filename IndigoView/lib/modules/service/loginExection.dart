class LoginException implements Exception {

  final message;
  LoginException(this.message);
  
  @override
  String toString() {
    return message ?? '';
  }
}