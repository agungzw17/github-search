part of 'models.dart';

class IssueModel {
  String? title;
  String? state;
  String? updatedAt;
  Map<String, dynamic>? user;

  IssueModel({this.title, this.state, this.updatedAt, this.user});

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(title: json['title'], state: json['state'], updatedAt: json['updated_at'], user: json['user']);
  }
}
