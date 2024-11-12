// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ONUResponse _$ONUResponseFromJson(Map<String, dynamic> json) => ONUResponse()
  ..id = (json['id'] as num?)?.toInt()
  ..linkedOnu = json['linked_onu'] == null
      ? null
      : LinkedOnu.fromJson(json['linked_onu'] as Map<String, dynamic>)
  ..onuIndex = json['onu_index'] as String?
  ..lineStatus = json['line_status'] as String?
  ..macAddress = json['mac_address'] as String?
  ..onuType = json['onu_type'] as String?
  ..aliveTime = json['alive_time'] as String?
  ..distance = json['distance'] as String?
  ..temperature = json['temperature'] as String?
  ..supplyVoltage = json['supply_voltage'] as String?
  ..txBias = json['tx_bias'] as String?
  ..txPower = (json['tx_power'] as num?)?.toDouble()
  ..rxPower = (json['rx_power'] as num?)?.toDouble()
  ..onuDescription = json['onu_description'] as String?
  ..lastDeregisterReason = json['last_deregister_reason'] as String?
  ..lastDeregisterTime = json['last_deregister_time'] as String?
  ..oltName = json['olt_name'] as String?
  ..ponPortIndex = json['pon_port_index'] as String?
  ..lastUpdated = json['last_updated'] as String?;

Map<String, dynamic> _$ONUResponseToJson(ONUResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linked_onu': instance.linkedOnu,
      'onu_index': instance.onuIndex,
      'line_status': instance.lineStatus,
      'mac_address': instance.macAddress,
      'onu_type': instance.onuType,
      'alive_time': instance.aliveTime,
      'distance': instance.distance,
      'temperature': instance.temperature,
      'supply_voltage': instance.supplyVoltage,
      'tx_bias': instance.txBias,
      'tx_power': instance.txPower,
      'rx_power': instance.rxPower,
      'onu_description': instance.onuDescription,
      'last_deregister_reason': instance.lastDeregisterReason,
      'last_deregister_time': instance.lastDeregisterTime,
      'olt_name': instance.oltName,
      'pon_port_index': instance.ponPortIndex,
      'last_updated': instance.lastUpdated,
    };

LinkedOnu _$LinkedOnuFromJson(Map<String, dynamic> json) => LinkedOnu()
  ..id = (json['id'] as num?)?.toInt()
  ..device = json['device'] == null
      ? null
      : Device.fromJson(json['device'] as Map<String, dynamic>)
  ..serialNumber = json['serial_number'] as String?
  ..modelName = json['model_name'] as String?
  ..wire = (json['wire'] as num?)?.toInt()
  ..wireType = json['wire_type'] as String?
  ..wireName = json['wire_name'] as String?
  ..wireColor = json['wire_color'] as String?
  ..wireIcon = json['wire_icon'] as String?
  ..mac = json['mac'] as String?
  ..wireCode = json['wire_code'] as String?
  ..wireMode = json['wire_mode'] as String?;

Map<String, dynamic> _$LinkedOnuToJson(LinkedOnu instance) => <String, dynamic>{
      'id': instance.id,
      'device': instance.device,
      'serial_number': instance.serialNumber,
      'model_name': instance.modelName,
      'wire': instance.wire,
      'wire_type': instance.wireType,
      'wire_name': instance.wireName,
      'wire_color': instance.wireColor,
      'wire_icon': instance.wireIcon,
      'mac': instance.mac,
      'wire_code': instance.wireCode,
      'wire_mode': instance.wireMode,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device()
  ..id = (json['id'] as num?)?.toInt()
  ..user = (json['user'] as num?)?.toInt()
  ..serialNumber = json['serial_number'] as String?
  ..modelName = json['model_name'] as String?
  ..locationName = json['location_name'] as String?
  ..latitude = json['latitude'] as String?
  ..longitude = json['longitude'] as String?
  ..mac = json['mac'] as String?;

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'serial_number': instance.serialNumber,
      'model_name': instance.modelName,
      'location_name': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'mac': instance.mac,
    };
