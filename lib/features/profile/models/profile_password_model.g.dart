// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePass _$ProfilePassFromJson(Map<String, dynamic> json) => ProfilePass(
      oldpass: json['oldpass'] as String,
      newpass: json['newpass'] as String,
      confirmpass: json['confirmpass'] as String,
    );

Map<String, dynamic> _$ProfilePassToJson(ProfilePass instance) =>
    <String, dynamic>{
      'oldpass': instance.oldpass,
      'newpass': instance.newpass,
      'confirmpass': instance.confirmpass,
    };
