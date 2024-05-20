import 'dart:convert';

class ApiResponseDto {
  String? token;
  int? id;
  String? error;

  ApiResponseDto({
    this.token,
    this.id,
    this.error,
  });

  factory ApiResponseDto.fromJson(Map<String, dynamic> json) {
    return ApiResponseDto(
      token: json['token'],
      id: json['id'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'error': error,
    };
  }

  static ApiResponseDto fromJsonString(String jsonString) {
    final jsonData = json.decode(jsonString);
    return ApiResponseDto.fromJson(jsonData);
  }

  String toJsonString() {
    final jsonData = toJson();
    return json.encode(jsonData);
  }
}
