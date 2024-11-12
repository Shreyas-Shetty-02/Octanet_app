import 'package:json_annotation/json_annotation.dart';

part 'ethernet_list_model.g.dart';

@JsonSerializable()
class EthernetList {
  int? id;

  @JsonKey(name: 'mikrotik_ip_address')
  String? mikrotikIpAddress;

  @JsonKey(name: 'ethernet_id')
  String? ethernetId;

  String? name;

  @JsonKey(name: 'mac_address')
  String? macAddress;

  @JsonKey(name: 'extra_data')
  ExtraData? extraData;

  EthernetList();

  factory EthernetList.fromJson(Map<String, dynamic> json) =>
      _$EthernetListFromJson(json);
  Map<String, dynamic> toJson() => _$EthernetListToJson(this);
}

@JsonSerializable()
class ExtraData {
  String? mtu;
  String? type;
  String? running;

  @JsonKey(name: 'rx_byte')
  String? rxByte;

  @JsonKey(name: 'rx_drop')
  String? rxDrop;

  @JsonKey(name: 'tx_byte')
  String? txByte;

  @JsonKey(name: 'tx_drop')
  String? txDrop;

  String? disabled;

  @JsonKey(name: 'rx_error')
  String? rxError;

  @JsonKey(name: 'tx_error')
  String? txError;

  @JsonKey(name: 'rx_packet')
  String? rxPacket;

  @JsonKey(name: 'tx_packet')
  String? txPacket;

  @JsonKey(name: 'actual_mtu')
  String? actualMtu;

  @JsonKey(name: 'fp_rx_byte')
  String? fpRxByte;

  @JsonKey(name: 'fp_tx_byte')
  String? fpTxByte;

  @JsonKey(name: 'link_downs')
  String? linkDowns;

  @JsonKey(name: 'default_name')
  String? defaultName;

  @JsonKey(name: 'fp_rx_packet')
  String? fpRxPacket;

  @JsonKey(name: 'fp_tx_packet')
  String? fpTxPacket;

  @JsonKey(name: 'tx_queue_drop')
  String? txQueueDrop;

  @JsonKey(name: 'last_link_up_time')
  String? lastLinkUpTime;

  ExtraData();

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExtraDataToJson(this);
}
