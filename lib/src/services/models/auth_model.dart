import 'dart:convert';

class AuthResponse {
  final String gymId;
  final String message;
  final bool? isProfileCompleted;
  final String? token;

  AuthResponse({
    required this.gymId,
    required this.message,
    this.isProfileCompleted,
    this.token,
  });

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      gymId: map["gymId"].toString(),
      message: map["message"],
      isProfileCompleted: map["isProfileCompleted"],
      token: map["token"],
    );
  }
}
