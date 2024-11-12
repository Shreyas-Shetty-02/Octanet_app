// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pppoe_client_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPPOEClientList _$PPPOEClientListFromJson(Map<String, dynamic> json) =>
    PPPOEClientList()
      ..id = (json['id'] as num?)?.toInt()
      ..mikrotikIpAddress = json['mikrotik_ip_address'] as String?
      ..active = json['active'] as bool?
      ..pppoeId = json['pppoe_id'] as String?
      ..pppoeName = json['pppoe_name'] as String?
      ..name = json['name'] as String?
      ..username = json['username'] as String?
      ..phoneNumber = json['phone_number'] as String?
      ..macAddress = json['mac_address'] as String?
      ..crmLink = json['crm_link'] as String?
      ..linkedOnu = json['linked_onu'] == null
          ? null
          : LinkedONU.fromJson(json['linked_onu'] as Map<String, dynamic>)
      ..pppoeData = json['pppoe_data'] == null
          ? null
          : PppoeData.fromJson(json['pppoe_data'] as Map<String, dynamic>);

Map<String, dynamic> _$PPPOEClientListToJson(PPPOEClientList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mikrotik_ip_address': instance.mikrotikIpAddress,
      'active': instance.active,
      'pppoe_id': instance.pppoeId,
      'pppoe_name': instance.pppoeName,
      'name': instance.name,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'mac_address': instance.macAddress,
      'crm_link': instance.crmLink,
      'linked_onu': instance.linkedOnu,
      'pppoe_data': instance.pppoeData,
    };

LinkedONU _$LinkedONUFromJson(Map<String, dynamic> json) => LinkedONU()
  ..id = (json['id'] as num?)?.toInt()
  ..device = json['device'] == null
      ? null
      : Device.fromJson(json['device'] as Map<String, dynamic>);

Map<String, dynamic> _$LinkedONUToJson(LinkedONU instance) => <String, dynamic>{
      'id': instance.id,
      'device': instance.device,
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

PppoeData _$PppoeDataFromJson(Map<String, dynamic> json) => PppoeData()
  ..mtu = json['mtu'] as String?
  ..type = json['type'] as String?
  ..dynamicData = json['dynamic'] as String?
  ..running = json['running'] as String?
  ..rxByte = json['rx_byte'] as String?
  ..rxDrop = json['rx_drop'] as String?
  ..txByte = json['tx_byte'] as String?
  ..txDrop = json['tx_drop'] as String?
  ..disabled = json['disabled'] as String?
  ..rxError = json['rx_error'] as String?
  ..txError = json['tx_error'] as String?
  ..rxPacket = json['rx_packet'] as String?
  ..txPacket = json['tx_packet'] as String?
  ..actualMtu = json['actual_mtu'] as String?
  ..fpRxByte = json['fp_rx_byte'] as String?
  ..fpTxByte = json['fp_tx_byte'] as String?
  ..linkDowns = json['link_downs'] as String?
  ..fpRxPacket = json['fp_rx_packet'] as String?
  ..fpTxPacket = json['fp_tx_packet'] as String?
  ..txQueueDrop = json['tx_queue_drop'] as String?
  ..lastLinkUpTime = json['last_link_up_time'] as String?;

Map<String, dynamic> _$PppoeDataToJson(PppoeData instance) => <String, dynamic>{
      'mtu': instance.mtu,
      'type': instance.type,
      'dynamic': instance.dynamicData,
      'running': instance.running,
      'rx_byte': instance.rxByte,
      'rx_drop': instance.rxDrop,
      'tx_byte': instance.txByte,
      'tx_drop': instance.txDrop,
      'disabled': instance.disabled,
      'rx_error': instance.rxError,
      'tx_error': instance.txError,
      'rx_packet': instance.rxPacket,
      'tx_packet': instance.txPacket,
      'actual_mtu': instance.actualMtu,
      'fp_rx_byte': instance.fpRxByte,
      'fp_tx_byte': instance.fpTxByte,
      'link_downs': instance.linkDowns,
      'fp_rx_packet': instance.fpRxPacket,
      'fp_tx_packet': instance.fpTxPacket,
      'tx_queue_drop': instance.txQueueDrop,
      'last_link_up_time': instance.lastLinkUpTime,
    };
