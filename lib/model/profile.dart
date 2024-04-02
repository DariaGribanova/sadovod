import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory Profile({
    required int id,
    required String userName,
    required String name,
    required String lastName,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}