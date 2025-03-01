class SignupReqParams {
  final String username;
  final String password;
  final String role = 'USER';

  SignupReqParams(
      {required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'role': role,
    };
  }
}
