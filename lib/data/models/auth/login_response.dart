class LoginResponse {
  bool? error;
  String? email;
  String? password;
  String? apiKey;
  String? message;

  LoginResponse(
      {this.error, this.email, this.password, this.apiKey, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    message = json["message"];
    email = json["email"];
    password = json["password"];
    apiKey = json["apiKey"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["error"] = error;
    _data["message"] = message;
    _data["email"] = email;
    _data["password"] = password;
    _data["apiKey"] = apiKey;
    return _data;
  }
}
