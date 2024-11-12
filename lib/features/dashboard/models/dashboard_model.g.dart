// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse()
      ..device = json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>)
      ..wire = json['wire'] == null
          ? null
          : Wire.fromJson(json['wire'] as Map<String, dynamic>)
      ..olt = json['olt'] == null
          ? null
          : Olt.fromJson(json['olt'] as Map<String, dynamic>)
      ..onu = json['onu'] == null
          ? null
          : Onu.fromJson(json['onu'] as Map<String, dynamic>)
      ..mikrotikIp = json['mikrotik_ip'] as String?
      ..mikrotikData = json['mikrotik_data'] == null
          ? null
          : MikrotikData.fromJson(json['mikrotik_data'] as Map<String, dynamic>)
      ..operator = json['operator'] == null
          ? null
          : Operator.fromJson(json['operator'] as Map<String, dynamic>);

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'device': instance.device,
      'wire': instance.wire,
      'olt': instance.olt,
      'onu': instance.onu,
      'mikrotik_ip': instance.mikrotikIp,
      'mikrotik_data': instance.mikrotikData,
      'operator': instance.operator,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      total: (json['total'] as num).toInt(),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => DeviceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'total': instance.total,
      'devices': instance.devices,
    };

DeviceDetail _$DeviceDetailFromJson(Map<String, dynamic> json) => DeviceDetail(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$DeviceDetailToJson(DeviceDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'id': instance.id,
    };

Wire _$WireFromJson(Map<String, dynamic> json) => Wire(
      total: (json['total'] as num).toInt(),
      wires: (json['wires'] as List<dynamic>)
          .map((e) => WireDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WireToJson(Wire instance) => <String, dynamic>{
      'total': instance.total,
      'wires': instance.wires,
    };

WireDetail _$WireDetailFromJson(Map<String, dynamic> json) => WireDetail(
      name: json['name'] as String,
      distance: (json['distance'] as num).toInt(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$WireDetailToJson(WireDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'distance': instance.distance,
      'id': instance.id,
    };

Olt _$OltFromJson(Map<String, dynamic> json) => Olt(
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$OltToJson(Olt instance) => <String, dynamic>{
      'total': instance.total,
    };

Onu _$OnuFromJson(Map<String, dynamic> json) => Onu(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      inactive: (json['inactive'] as num).toInt(),
      down: (json['down'] as num).toInt(),
    );

Map<String, dynamic> _$OnuToJson(Onu instance) => <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'inactive': instance.inactive,
      'down': instance.down,
    };

MikrotikData _$MikrotikDataFromJson(Map<String, dynamic> json) => MikrotikData(
      uptime: json['uptime'] as String,
      cpuLoad: json['cpu_load'] as String,
      freeMemory: json['free_memory'] as String,
      totalMemory: json['total_memory'] as String,
      freeHddSpace: json['free_hdd_space'] as String,
      totalHddSpace: json['total_hdd_space'] as String,
    );

Map<String, dynamic> _$MikrotikDataToJson(MikrotikData instance) =>
    <String, dynamic>{
      'uptime': instance.uptime,
      'cpu_load': instance.cpuLoad,
      'free_memory': instance.freeMemory,
      'total_memory': instance.totalMemory,
      'free_hdd_space': instance.freeHddSpace,
      'total_hdd_space': instance.totalHddSpace,
    };

Operator _$OperatorFromJson(Map<String, dynamic> json) => Operator(
      noOperators: json['noOperators'] as String,
      noArea: (json['noArea'] as num?)?.toInt(),
      noDevices: (json['noDevices'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'noOperators': instance.noOperators,
      'noArea': instance.noArea,
      'noDevices': instance.noDevices,
    };
