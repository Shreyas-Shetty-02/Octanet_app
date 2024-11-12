import 'package:json_annotation/json_annotation.dart';
part 'mikrotik_log_model.g.dart';

@JsonSerializable()
class MikrotikLog {
  int? srNo;
  String? id;
  String? time;
  String? topics;
  String? message;

  MikrotikLog();

  factory MikrotikLog.fromJson(Map<String, dynamic> json) =>
      _$MikrotikLogFromJson(json);
  Map<String, dynamic> toJson() => _$MikrotikLogToJson(this);
}
