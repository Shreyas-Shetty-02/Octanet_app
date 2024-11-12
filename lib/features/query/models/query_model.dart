import 'package:json_annotation/json_annotation.dart';

part 'query_model.g.dart';

@JsonSerializable()
class QueryResponse {
  int? id;
  QueryType? type;
  String? question;
  String? details;

  @JsonKey(name: 'query_status')
  String? queryStatus;

  @JsonKey(name: 'close_by')
  String? closeBy;

  @JsonKey(name: 'query_files')
  List<QueryFile>? queryFiles;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'created_by')
  int? createdBy;

  String? status;
  String? solution;

  @JsonKey(name: 'query_by')
  QueryBy? queryBy;

  QueryResponse({
    this.id,
    this.type,
    this.question,
    this.details,
    this.queryStatus,
    this.closeBy,
    this.queryFiles,
    this.createdAt,
    this.createdBy,
    this.status,
    this.solution,
    this.queryBy,
  });

  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);
}

@JsonSerializable()
class QueryType {
  int? id;
  String? name;

  QueryType({this.id, this.name});

  factory QueryType.fromJson(Map<String, dynamic> json) =>
      _$QueryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$QueryTypeToJson(this);
}

@JsonSerializable()
class QueryFile {
  int? id;
  int? query;
  String file;
  String? type;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'created_by')
  String? createdBy;

  String? status;

  QueryFile(
      {this.id,
      this.query,
      required this.file,
      this.type,
      this.createdAt,
      this.createdBy,
      this.status});

  factory QueryFile.fromJson(Map<String, dynamic> json) =>
      _$QueryFileFromJson(json);

  Map<String, dynamic> toJson() => _$QueryFileToJson(this);
}

@JsonSerializable()
class QueryBy {
  @JsonKey(name: 'company_name')
  String? companyName;

  @JsonKey(name: 'owner_name')
  String? ownerName;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  String? email;

  @JsonKey(name: 'user_type')
  String? userType;

  QueryBy(
      {this.companyName,
      this.ownerName,
      this.phoneNumber,
      this.email,
      this.userType});

  factory QueryBy.fromJson(Map<String, dynamic> json) =>
      _$QueryByFromJson(json);

  Map<String, dynamic> toJson() => _$QueryByToJson(this);
}
