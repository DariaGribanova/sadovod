// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('lastname', instance.lastname);
  return val;
}
