import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class ApiErrorModel {
  final int? statusCode;
  final String? message;
  final List<String>? errors;

  ApiErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  static const jsonSchema = _$ApiErrorModelJsonSchema;
}
