part of 'services.dart';

class SearchGithubServices {
  static Future<HttpResponseModel> getListUser({String? query, int? page}) async {
    var response =
    await http.get(Uri.parse('${githubApiKey}search/users?q=$query&page=${page.toString()}'));
    var jsonObject = json.decode(response.body) as Map<String, dynamic>;

    return HttpResponseModel.fromJson(jsonObject);
  }

  // static Future<List<UserModel>> getListUser({String? query}) async {
  //   var response =
  //       await http.get(Uri.parse('${githubApiKey}search/users?q=$query'));
  //
  //   if (response.statusCode == 200) {
  //     var jsonObject = json.decode(response.body);
  //     var items = (jsonObject as Map<String, dynamic>)['items'] as List;
  //     if (kDebugMode) {
  //       print(items);
  //     }
  //     return items.map<UserModel>((item) => UserModel.fromJson(item)).toList();
  //   } else {
  //     return [];
  //   }
  // }

  static Future<HttpResponseModel> getListIssue({String? query}) async {
    var response =
    await http.get(Uri.parse('${githubApiKey}search/issues?q=$query'));
    var jsonObject = json.decode(response.body) as Map<String, dynamic>;

    return HttpResponseModel.fromJson(jsonObject);
  }

  // static Future<List<IssueModel>> getListIssue({String? query}) async {
  //   var response =
  //   await http.get(Uri.parse('${githubApiKey}search/issues?q=$query'));
  //
  //   if (response.statusCode == 200) {
  //     var jsonObject = json.decode(response.body);
  //     var items = (jsonObject as Map<String, dynamic>)['items'] as List;
  //     if (kDebugMode) {
  //       print(items);
  //     }
  //     return items
  //         .map<IssueModel>((item) => IssueModel.fromJson(item))
  //         .toList();
  //   } else {
  //     return [];
  //   }
  // }

  static Future<HttpResponseModel> getListRepository({String? query}) async {
    var response =
    await http.get(Uri.parse('${githubApiKey}search/repositories?q=$query'));
    var jsonObject = json.decode(response.body) as Map<String, dynamic>;

    return HttpResponseModel.fromJson(jsonObject);
  }

  // static Future<List<RepositoryModel>> getListRepository({String? query}) async {
  //   var response = await http
  //       .get(Uri.parse('${githubApiKey}search/repositories?q=$query'));
  //
  //   if (response.statusCode == 200) {
  //     var jsonObject = json.decode(response.body);
  //     var items = (jsonObject as Map<String, dynamic>)['items'] as List;
  //     if (kDebugMode) {
  //       print(items);
  //     }
  //     return items
  //         .map<RepositoryModel>((item) => RepositoryModel.fromJson(item))
  //         .toList();
  //   } else {
  //     return [];
  //   }
  // }


}
