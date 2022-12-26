import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yumemi_code_check_app/model/github_response.dart';

class GithubApiClient {
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
      print(error.toString());
      throw Exception(error.toString());
    }
  }
}
