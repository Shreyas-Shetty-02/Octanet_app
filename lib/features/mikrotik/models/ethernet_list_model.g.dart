// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethernet_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EthernetList _$EthernetListFromJson(Map<String, dynamic> json) => EthernetList()
  ..id = (json['id'] as num?)?.toInt()
  ..mikrotikIpAddress = json['mikrotik_ip_address'] as String?
  ..ethernetId = json['ethernet_id'] as String?
  ..name = json['name'] as String?
  ..macAddress = json['mac_address'] as String?
  ..extraData = json['extra_data'] == null
      ? null
      : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>);

Map<String, dynamic> _$EthernetListToJson(EthernetList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mikrotik_ip_address': instance.mikrotikIpAddress,
      'ethernet_id': instance.ethernetId,
      'name': instance.name,
      'mac_address': instance.macAddress,
      'extra_data': instance.extraData,
    };

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData()
  ..mtu = json['mtu'] as String?
  ..type = json['type'] as String?
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
  ..defaultName = json['default_name'] as String?
  ..fpRxPacket = json['fp_rx_packet'] as String?
  ..fpTxPacket = json['fp_tx_packet'] as String?
  ..txQueueDrop = json['tx_queue_drop'] as String?
  ..lastLinkUpTime = json['last_link_up_time'] as String?;

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) => <String, dynamic>{
      'mtu': instance.mtu,
      'type': instance.type,
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
      'default_name': instance.defaultName,
      'fp_rx_packet': instance.fpRxPacket,
      'fp_tx_packet': instance.fpTxPacket,
      'tx_queue_drop': instance.txQueueDrop,
      'last_link_up_time': instance.lastLinkUpTime,
    };
