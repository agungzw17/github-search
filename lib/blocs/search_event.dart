part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class FetchSearch extends SearchEvent {
  String? query = '';
  String? searchGithubItem = '';
  int? page = 1;
  bool? buttonSearch = false;

  FetchSearch({this.query, this.searchGithubItem, this.page, this.buttonSearch});
}
