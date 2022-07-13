part of 'search_bloc.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  String? message;

  SearchError({this.message});
}

class SearchLoaded extends SearchState {
  List<UserModel>? users = [];
  List<IssueModel>? issues = [];
  List<RepositoryModel>? repository = [];

  bool? hasReachedMax;

  SearchLoaded({this.users, this.issues, this.repository, this.hasReachedMax});

  SearchLoaded copyWith({List<UserModel>? users, List<IssueModel>? issues, List<RepositoryModel>? repository, bool? hasReachedMax}) {
    return SearchLoaded(
      users: users ?? this.users,
      issues: issues ?? this.issues,
      repository: repository ?? this.repository,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }
}
