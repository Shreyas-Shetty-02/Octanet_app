// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      email: json['email'] as String?,
      id: (json['id'] as num?)?.toInt(),
      roles: json['roles'] as List<dynamic>?,
      userType: json['user_type'] as String?,
      permissions: json['permissions'] as List<dynamic>?,
      accessTokenExpire: (json['access_token_expire'] as num?)?.toInt(),
      refreshTokenExpire: (json['refresh_token_expire'] as num?)?.toInt(),
      loginTime: LoginResponse._fromJson((json['login_time'] as num?)?.toInt()),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'email': instance.email,
      'id': instance.id,
      'roles': instance.roles,
      'user_type': instance.userType,
      'permissions': instance.permissions,
      'access_token_expire': instance.accessTokenExpire,
      'refresh_token_expire': instance.refreshTokenExpire,
      'login_time': LoginResponse._toJson(instance.loginTime),
    };
