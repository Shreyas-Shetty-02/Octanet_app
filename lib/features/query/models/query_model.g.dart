// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) =>
    QueryResponse(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : QueryType.fromJson(json['type'] as Map<String, dynamic>),
      question: json['question'] as String?,
      details: json['details'] as String?,
      queryStatus: json['query_status'] as String?,
      closeBy: json['close_by'] as String?,
      queryFiles: (json['query_files'] as List<dynamic>?)
          ?.map((e) => QueryFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      status: json['status'] as String?,
      solution: json['solution'] as String?,
      queryBy: json['query_by'] == null
          ? null
          : QueryBy.fromJson(json['query_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'question': instance.question,
      'details': instance.details,
      'query_status': instance.queryStatus,
      'close_by': instance.closeBy,
      'query_files': instance.queryFiles,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'status': instance.status,
      'solution': instance.solution,
      'query_by': instance.queryBy,
    };

QueryType _$QueryTypeFromJson(Map<String, dynamic> json) => QueryType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$QueryTypeToJson(QueryType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

QueryFile _$QueryFileFromJson(Map<String, dynamic> json) => QueryFile(
      id: (json['id'] as num?)?.toInt(),
      query: (json['query'] as num?)?.toInt(),
      file: json['file'] as String,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$QueryFileToJson(QueryFile instance) => <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'file': instance.file,
      'type': instance.type,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'status': instance.status,
    };

QueryBy _$QueryByFromJson(Map<String, dynamic> json) => QueryBy(
      companyName: json['company_name'] as String?,
      ownerName: json['owner_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      userType: json['user_type'] as String?,
    );

Map<String, dynamic> _$QueryByToJson(QueryBy instance) => <String, dynamic>{
      'company_name': instance.companyName,
      'owner_name': instance.ownerName,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'user_type': instance.userType,
    };
