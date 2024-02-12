class LoginDto {
  String? username;
  String? password;
  String? requestToken;

  LoginDto({this.username, this.password, this.requestToken});

  LoginDto.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['request_token'] = this.requestToken;
    return data;
  }
}
