import 'api_error.dart';

class ApiErrorBody {
  final String message;
  final ApiError errors;
  final String documentationUrl;

  ApiErrorBody({
    required this.message,
    required this.errors,
    required this.documentationUrl,
  });

  ApiErrorBody.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        errors = json['errors'],
        documentationUrl = json[''];
}
