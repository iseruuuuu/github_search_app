import 'api_error_body.dart';

class ApiException implements Exception {
  ApiException({
    required this.code,
    required this.body,
  });
  final int code;
  final String body;

  // MEMO(tsuruoka): 本来は生のエラーコードやメッセージをユーザーに表示するべきではないので
  // 表示用の`displayMessage`などを定義して表示する必要がある。
  @override
  String toString() => '[$code] ${body.toString()}';
}