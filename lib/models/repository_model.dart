part of 'models.dart';

class RepositoryModel {
  String? fullName;
  String? createdAt;
  int? watchersCount;
  int? stargazersCount;
  int? forksCount;
  Map<String, dynamic>? owner;

  RepositoryModel(
      {this.fullName,
      this.createdAt,
      this.watchersCount,
      this.stargazersCount,
      this.forksCount,
      this.owner});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
        fullName: json['full_name'],
        createdAt: json['created_at'],
        watchersCount: json['watchers_count'],
        stargazersCount: json['stargazers_count'],
        forksCount: json['forks_count'],
        owner: json['owner']);
  }
}
