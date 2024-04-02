import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory Auth({
    required String username,
    required String password,
    String? name,
    String? lastname,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}