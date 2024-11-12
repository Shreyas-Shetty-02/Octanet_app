import 'package:Octanet/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'query_request_model.g.dart';

@JsonSerializable()
class QueryRequest extends BaseModel {
  String type;
  String question;
  String details;

  @JsonKey(name: 'file_upload')
  String? fileUpload;

  QueryRequest({
    required this.type,
    required this.question,
    required this.details,
  });

  factory QueryRequest.fromJson(Map<String, dynamic> json) =>
      _$QueryRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QueryRequestToJson(this);
}
