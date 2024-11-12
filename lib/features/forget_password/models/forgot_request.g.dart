// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotRequest _$ForgotRequestFromJson(Map<String, dynamic> json) =>
    ForgotRequest(
      email: json['email'] as String?,
    )..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$ForgotRequestToJson(ForgotRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };
