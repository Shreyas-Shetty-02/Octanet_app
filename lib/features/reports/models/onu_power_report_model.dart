import 'package:json_annotation/json_annotation.dart';

part 'onu_power_report_model.g.dart';

@JsonSerializable()
class ONUPowerReport {
  int? id;

  @JsonKey(name: 'mac_address')
  String? macAddress;

  @JsonKey(name: 'model_name')
  String? modelName;

  @JsonKey(name: 'line_status')
  String? lineStatus;

  @JsonKey(name: 'onu_power_report')
  List<OnuPowerData>? onuPowerReport;

  @JsonKey(name: 'pppoes_name')
  List<String>? pppoesName;

  ONUPowerReport();

  factory ONUPowerReport.fromJson(Map<String, dynamic> json) =>
      _$ONUPowerReportFromJson(json);

  Map<String, dynamic> toJson() => _$ONUPowerReportToJson(this);
}

@JsonSerializable()
class OnuPowerData {
  @JsonKey(name: 'rx_power')
  double? rxPower;

  @JsonKey(name: 'created_at')
  String? createdAt;

  OnuPowerData();

  factory OnuPowerData.fromJson(Map<String, dynamic> json) =>
      _$OnuPowerDataFromJson(json);

  Map<String, dynamic> toJson() => _$OnuPowerDataToJson(this);
}
