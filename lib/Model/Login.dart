class Login {
  int code;
  bool status;
  String token;
  int userId;

  Login(
      {required this.code,
      required this.status,
      required this.token,
      required this.userId});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj["code"],
      status: obj["status"],
      token: obj["data"]["auth_key"],
      userId: obj["data"]["member_id"],
    );
  }
}
