// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVisibility: json['emailVisibility'] as bool,
      avatar: json['avatar'] as String?,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'email': instance.email,
      'emailVisibility': instance.emailVisibility,
      if (instance.avatar case final value?) 'avatar': value,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'verified': instance.verified,
    };
