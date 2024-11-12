// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotResponse _$ForgotResponseFromJson(Map<String, dynamic> json) =>
    ForgotResponse(
      email: json['email'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ForgotResponseToJson(ForgotResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'status': instance.status,
    };
