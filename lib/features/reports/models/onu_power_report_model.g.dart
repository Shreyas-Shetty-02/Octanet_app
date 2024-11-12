// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onu_power_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ONUPowerReport _$ONUPowerReportFromJson(Map<String, dynamic> json) =>
    ONUPowerReport()
      ..id = (json['id'] as num?)?.toInt()
      ..macAddress = json['mac_address'] as String?
      ..modelName = json['model_name'] as String?
      ..lineStatus = json['line_status'] as String?
      ..onuPowerReport = (json['onu_power_report'] as List<dynamic>?)
          ?.map((e) => OnuPowerData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..pppoesName = (json['pppoes_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$ONUPowerReportToJson(ONUPowerReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mac_address': instance.macAddress,
      'model_name': instance.modelName,
      'line_status': instance.lineStatus,
      'onu_power_report': instance.onuPowerReport,
      'pppoes_name': instance.pppoesName,
    };

OnuPowerData _$OnuPowerDataFromJson(Map<String, dynamic> json) => OnuPowerData()
  ..rxPower = (json['rx_power'] as num?)?.toDouble()
  ..createdAt = json['created_at'] as String?;

Map<String, dynamic> _$OnuPowerDataToJson(OnuPowerData instance) =>
    <String, dynamic>{
      'rx_power': instance.rxPower,
      'created_at': instance.createdAt,
    };
