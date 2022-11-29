class Login {
  int code;
  bool status;
  String token;
  int userId;
  String userEmail;

  Login(
      {required this.code,
      required this.status,
      required this.token,
      required this.userId,
      required this.userEmail});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj["code"],
      status: obj["status"],
      token: obj["data"]["token"],
      userId: obj["data"]["user"]["id"],
      userEmail: obj["data"]["user"]["email"],
    );
  }
}
