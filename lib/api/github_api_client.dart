import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yumemi_code_check_app/model/error/api_expception.dart';
import 'package:yumemi_code_check_app/model/github_response.dart';

class GithubApiClient {
  Future<GithubResponse> get({required String query}) async {
    final response = await http.get(Uri.https(
      'api.github.com',
      '/search/repositories',
      {'q': query},
    ));

    if (response.statusCode == 200) {
      return GithubResponse.fromJson(jsonDecode(response.body));
    }

    //error handling
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    print(response.statusCode);
    print(response.body);
    print(json);
    // final errorBody = ApiErrorBody.fromJson(json);
    throw ApiException(code: response.statusCode, body: response.body);
    //Unhandled Exception: [422] {"message":"Validation Failed","errors":[{"resource":"Search","field":"q","code":"missing"}],
  }

  Future<GithubResponse> fetch(String query) async {
    try {
      final response = await http.get(
        Uri.https(
          'api.github.com',
          '/search/repositories',
          {'q': query},
        ),
      );

      return GithubResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
