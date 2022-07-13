import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/shared/shared.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FetchSearch>((event, emit) async {
      ///jika coba - coba 2 berhasil maka harus ditambahkan pada masing" logic event.searchGithubItem
      // emit(SearchLoading());

      if (event.searchGithubItem == "user") {
        ///Coba - coba 1
        // users = await SearchGithubServices.getListUser(query: event.query);
        // emit(SearchLoaded(users: users, issues: [], repository: []));

        ///Coba - coba 2
        // HttpResponseModel httpResponseModel = await SearchGithubServices.getListUser(query: event.query, page: 1);
        // print("Bloc file httpResponseModel");
        // if(httpResponseModel.items != null) {
        //   print(httpResponseModel.items);
        //
        //   var items = httpResponseModel.items as List;
        //
        //   List<UserModel> users = items.map((e) => UserModel.fromJson(e)).toList();
        //
        //   emit(SearchLoaded(users: users, issues: [], repository: []));
        // }
        // if(httpResponseModel.message != null){
        //   print(httpResponseModel.message);
        //
        //   emit(SearchError(message: httpResponseModel.message));
        // }

        ///coba-coba 3
        if(event.buttonSearch == true) {
          emit(SearchLoading());
          List<UserModel> users = [];

          HttpResponseModel httpResponseModel =
          await SearchGithubServices.getListUser(
              query: event.query, page: 1);
          print("Bloc file httpResponseModel");
          if (httpResponseModel.items != null) {
            print(httpResponseModel.items);

            var items = httpResponseModel.items as List;

            users = items.map((e) => UserModel.fromJson(e)).toList();

            emit(SearchLoaded(
                users: users,
                issues: [],
                repository: [],
                hasReachedMax: false));
          }
          if (httpResponseModel.message != null) {
            print(httpResponseModel.message);

            emit(SearchError(message: httpResponseModel.message));
          }
        } else {
          List<UserModel> users = [];
          if (state is SearchInitial) {
            emit(SearchLoading());

            HttpResponseModel httpResponseModel =
            await SearchGithubServices.getListUser(
                query: event.query, page: 1);
            print("Bloc file httpResponseModel");
            if (httpResponseModel.items != null) {
              print(httpResponseModel.items);

              var items = httpResponseModel.items as List;

              users = items.map((e) => UserModel.fromJson(e)).toList();

              emit(SearchLoaded(
                  users: users,
                  issues: [],
                  repository: [],
                  hasReachedMax: false));
            }
            if (httpResponseModel.message != null) {
              print(httpResponseModel.message);

              emit(SearchError(message: httpResponseModel.message));
            }
          } else {
            SearchLoaded searchLoaded = state as SearchLoaded;
            searchPage = searchPage + 1;

            print("File bloc scroll page $searchPage");

            HttpResponseModel httpResponseModel =
            await SearchGithubServices.getListUser(
                query: event.query, page: searchPage);

            if (httpResponseModel.items != null) {
              print(httpResponseModel.items);

              var items = httpResponseModel.items as List;

              users = items.map((e) => UserModel.fromJson(e)).toList();

              emit((users.isEmpty)
                  ? SearchLoaded(
                  users: [], issues: [], repository: [], hasReachedMax: true)
                  : SearchLoaded(
                  users: searchLoaded.users! + users,
                  issues: [],
                  repository: [],
                  hasReachedMax: false));
            }
            if (httpResponseModel.message != null) {
              print(httpResponseModel.message);

              emit(SearchError(message: httpResponseModel.message));
            }
          }
        }
      } else if (event.searchGithubItem == "issue") {
        emit(SearchLoading());
        ///Coba - coba 1
        // issues = await SearchGithubServices.getListIssue(query: event.query);
        // emit(SearchLoaded(issues: issues, users: [], repository: []));

        ///Coba - coba 2
        HttpResponseModel httpResponseModel =
            await SearchGithubServices.getListIssue(query: event.query);
        print("Bloc file httpResponseModel");
        if (httpResponseModel.items != null) {
          print(httpResponseModel.items);

          var items = httpResponseModel.items as List;

          List<IssueModel> issues =
              items.map((e) => IssueModel.fromJson(e)).toList();

          emit(SearchLoaded(issues: issues, users: [], repository: []));
        }
        if (httpResponseModel.message != null) {
          print(httpResponseModel.message);

          emit(SearchError(message: httpResponseModel.message));
        }
      } else if (event.searchGithubItem == "repository") {
        emit(SearchLoading());
        ///Coba-coba 1
        // repositories =
        //     await SearchGithubServices.getListRepository(query: event.query);
        // emit(SearchLoaded(repository: repositories, users: [], issues: []));

        ///Coba - coba 2
        HttpResponseModel httpResponseModel =
            await SearchGithubServices.getListRepository(query: event.query);
        print("Bloc file httpResponseModel");
        if (httpResponseModel.items != null) {
          print(httpResponseModel.items);

          var items = httpResponseModel.items as List;

          List<RepositoryModel> repositories =
              items.map((e) => RepositoryModel.fromJson(e)).toList();

          emit(SearchLoaded(repository: repositories, users: [], issues: []));
        }
        if (httpResponseModel.message != null) {
          print(httpResponseModel.message);

          emit(SearchError(message: httpResponseModel.message));
        }
      } else {
        emit(SearchLoaded(users: [], issues: [], repository: []));
      }
    });
  }
}
