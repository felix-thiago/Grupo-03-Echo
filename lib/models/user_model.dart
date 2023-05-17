class UserModel {
  final String username;
  final String password;

  UserModel({required this.username, required this.password});
  factory UserModel.fromJson(Map json) {
    return UserModel(
      username: json["username"],
      password: json["password"],
    );
  }

  Map toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
