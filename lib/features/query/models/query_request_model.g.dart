// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryRequest _$QueryRequestFromJson(Map<String, dynamic> json) => QueryRequest(
      type: json['type'] as String,
      question: json['question'] as String,
      details: json['details'] as String,
    )
      ..id = (json['id'] as num?)?.toInt()
      ..fileUpload = json['file_upload'] as String?;

Map<String, dynamic> _$QueryRequestToJson(QueryRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'question': instance.question,
      'details': instance.details,
      'file_upload': instance.fileUpload,
    };
