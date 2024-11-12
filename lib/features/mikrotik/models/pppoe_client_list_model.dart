import 'package:json_annotation/json_annotation.dart';

part 'pppoe_client_list_model.g.dart';

@JsonSerializable()
class PPPOEClientList {
  int? id;

  @JsonKey(name: 'mikrotik_ip_address')
  String? mikrotikIpAddress;

  bool? active;

  @JsonKey(name: 'pppoe_id')
  String? pppoeId;

  @JsonKey(name: 'pppoe_name')
  String? pppoeName;

  String? name;
  String? username;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'mac_address')
  String? macAddress;

  @JsonKey(name: 'crm_link')
  String? crmLink;

  @JsonKey(name: 'linked_onu')
  LinkedONU? linkedOnu;

  @JsonKey(name: 'pppoe_data')
  PppoeData? pppoeData;

  PPPOEClientList();

  factory PPPOEClientList.fromJson(Map<String, dynamic> json) =>
      _$PPPOEClientListFromJson(json);
  Map<String, dynamic> toJson() => _$PPPOEClientListToJson(this);
}

@JsonSerializable()
class LinkedONU {
  int? id;
  Device? device;

  LinkedONU();

  factory LinkedONU.fromJson(Map<String, dynamic> json) =>
      _$LinkedONUFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedONUToJson(this);
}

@JsonSerializable()
class Device {
  int? id;
  int? user;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'model_name')
  String? modelName;

  @JsonKey(name: 'location_name')
  String? locationName;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'mac')
  String? mac;

  Device();

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class PppoeData {
  String? mtu;
  String? type;

  @JsonKey(name: 'dynamic')
  String? dynamicData;

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

  @JsonKey(name: 'fp_rx_packet')
  String? fpRxPacket;

  @JsonKey(name: 'fp_tx_packet')
  String? fpTxPacket;

  @JsonKey(name: 'tx_queue_drop')
  String? txQueueDrop;

  @JsonKey(name: 'last_link_up_time')
  String? lastLinkUpTime;

  PppoeData();

  factory PppoeData.fromJson(Map<String, dynamic> json) =>
      _$PppoeDataFromJson(json);
  Map<String, dynamic> toJson() => _$PppoeDataToJson(this);
}
