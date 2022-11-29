class Register {
  int code;
  bool status;
  String data;

  Register({required this.code, required this.status, required this.data});

  factory Register.fromJson(Map<String, dynamic> obj) {
    return Register(
        code: obj["code"], status: obj["status"], data: obj["data"]);
  }
}
