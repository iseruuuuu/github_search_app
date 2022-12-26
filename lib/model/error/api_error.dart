class ApiError {
  final String message;
  final String field;
  final String code;

  ApiError({
    required this.message,
    required this.field,
    required this.code,
  });

  ApiError.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        field = json['field'],
        code = json['code'];
}
