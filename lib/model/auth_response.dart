import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.g.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: "refreshToken") required String refreshToken,
    @JsonKey(name: "token") required String token,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
