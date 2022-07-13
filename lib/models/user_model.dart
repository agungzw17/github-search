part of 'models.dart';

class UserModel {
  String? login;
  String? avatarUrl;

  UserModel({this.login, this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(login: json['login'], avatarUrl: json['avatar_url']);
  }
}
