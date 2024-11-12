// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mikrotik_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MikrotikLog _$MikrotikLogFromJson(Map<String, dynamic> json) => MikrotikLog()
  ..srNo = (json['srNo'] as num?)?.toInt()
  ..id = json['id'] as String?
  ..time = json['time'] as String?
  ..topics = json['topics'] as String?
  ..message = json['message'] as String?;

Map<String, dynamic> _$MikrotikLogToJson(MikrotikLog instance) =>
    <String, dynamic>{
      'srNo': instance.srNo,
      'id': instance.id,
      'time': instance.time,
      'topics': instance.topics,
      'message': instance.message,
    };
