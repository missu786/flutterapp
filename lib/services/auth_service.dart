class AuthService {
  static Future login(String email, String password) async {
    print("Login: $email");
    return true;
  }
}