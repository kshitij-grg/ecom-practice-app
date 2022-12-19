class LoginResponse {
  bool? error;
  String? message;

  LoginResponse({this.error, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["error"] = error;
    _data["message"] = message;
    return _data;
  }
}
