// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_and_wire_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceAndWireReport _$DeviceAndWireReportFromJson(Map<String, dynamic> json) =>
    DeviceAndWireReport()
      ..device = json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>)
      ..wire = json['wire'] == null
          ? null
          : Wire.fromJson(json['wire'] as Map<String, dynamic>);

Map<String, dynamic> _$DeviceAndWireReportToJson(
        DeviceAndWireReport instance) =>
    <String, dynamic>{
      'device': instance.device,
      'wire': instance.wire,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device()
  ..total = (json['total'] as num?)?.toInt()
  ..devices = (json['devices'] as List<dynamic>?)
      ?.map((e) => DeviceItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'total': instance.total,
      'devices': instance.devices,
    };

DeviceItem _$DeviceItemFromJson(Map<String, dynamic> json) => DeviceItem()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..count = (json['count'] as num?)?.toInt();

Map<String, dynamic> _$DeviceItemToJson(DeviceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
    };

Wire _$WireFromJson(Map<String, dynamic> json) => Wire()
  ..total = (json['total'] as num?)?.toDouble()
  ..wires = (json['wires'] as List<dynamic>?)
      ?.map((e) => WireItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$WireToJson(Wire instance) => <String, dynamic>{
      'total': instance.total,
      'wires': instance.wires,
    };

WireItem _$WireItemFromJson(Map<String, dynamic> json) => WireItem()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..distance = (json['distance'] as num?)?.toDouble();

Map<String, dynamic> _$WireItemToJson(WireItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'distance': instance.distance,
    };
