part of 'models.dart';

class HttpResponseModel {
  ///success
  String? totalCount;
  String? incompleteResults;
  List<dynamic>? items;

  ///error
  List<dynamic>? errors;

  ///error and limit
  String? documentationUrl;
  String? message;

  HttpResponseModel(
      {this.totalCount,
      this.incompleteResults,
      this.items,
      this.errors,
      this.documentationUrl,
      this.message});

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
        totalCount: json['total_count'].toString(),
        incompleteResults: json['total_count'].toString(),
        items: json['items'],
        errors: json['errors'],
        documentationUrl: json['documentation_url'],
        message: json['message']);
  }
}
