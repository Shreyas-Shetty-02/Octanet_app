import 'package:json_annotation/json_annotation.dart';

part 'user_device_model.g.dart';

@JsonSerializable()
class UserDevice {
  int? id;
  int? user;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'location_name')
  String? locationName;

  String? latitude;
  String? longitude;
  List<String>? images;
  int? item;

  @JsonKey(name: 'item_name')
  String? itemName;

  @JsonKey(name: 'item_icon')
  String? itemIcon;

  @JsonKey(name: 'device_icon')
  String? deviceIcon;

  @JsonKey(name: 'item_category')
  String? itemCategory;

  String? mac;
  String? username;
  String? phone;
  String? detail;
  List<Connection>? connections;

  UserDevice();

  factory UserDevice.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$UserDeviceToJson(this);
}

@JsonSerializable()
class Connection {
  int? id;
  int? device;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'model_name')
  String? modelName;

  @JsonKey(name: 'connected_device')
  int? connectedDevice;
  int? wire;

  @JsonKey(name: 'wire_type')
  String? wireType;

  @JsonKey(name: 'wire_name')
  String? wireName;

  @JsonKey(name: 'wire_color')
  String? wireColor;

  @JsonKey(name: 'wire_icon')
  String? wireIcon;

  List<LatLng>? path;
  String? power;

  @JsonKey(name: 'power_drop')
  String? powerDrop;

  @JsonKey(name: 'onu_pppoes')
  List<OnuPppoe>? onuPppoes;

  @JsonKey(name: 'onu_device')
  List<OnuDevice>? onuDevice;
  String? details;
  String? distance;
  String? loop;
  List<int>? loops;

  @JsonKey(name: 'loop_desc')
  List<String>? loopDesc;

  @JsonKey(name: 'unique_id')
  String? uniqueId;

  @JsonKey(name: 'boxcores')
  List<BoxCore>? boxCores;

  @JsonKey(name: 'wire_code')
  String? wireCode;

  @JsonKey(name: 'wire_mode')
  String? wireMode;

  String? mac;

  Connection();

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}

@JsonSerializable()
class LatLng {
  double? lat;
  double? lng;

  LatLng({
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}

@JsonSerializable()
class OnuPppoe {
  int? id;

  @JsonKey(name: 'pppoe_id')
  String? pppoeId;

  @JsonKey(name: 'pppoe_name')
  String? pppoeName;

  bool? active;
  String? name;
  String? username;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'mac_address')
  String? macAddress;

  @JsonKey(name: 'crm_link')
  String? crmLink;

  @JsonKey(name: 'pppoe_data')
  PppoeData? pppoeData;

  OnuPppoe();

  factory OnuPppoe.fromJson(Map<String, dynamic> json) =>
      _$OnuPppoeFromJson(json);
  Map<String, dynamic> toJson() => _$OnuPppoeToJson(this);
}

@JsonSerializable()
class PppoeData {
  String? mtu;
  String? type;

  @JsonKey(name: 'dynamic')
  String? isDynamic;
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

@JsonSerializable()
class OnuDevice {
  int? id;

  @JsonKey(name: 'onu_index')
  String? onuIndex;

  @JsonKey(name: 'line_status')
  String? lineStatus;

  @JsonKey(name: 'mac_address')
  String? macAddress;

  @JsonKey(name: 'onu_type')
  String? onuType;

  @JsonKey(name: 'alive_time')
  String? aliveTime;

  String? distance;
  String? temperature;

  @JsonKey(name: 'supply_voltage')
  String? supplyVoltage;

  @JsonKey(name: 'tx_bias')
  String? txBias;

  @JsonKey(name: 'tx_power')
  double? txPower;

  @JsonKey(name: 'rx_power')
  double? rxPower;

  @JsonKey(name: 'onu_description')
  String? onuDescription;

  @JsonKey(name: 'last_deregister_reason')
  String? lastDeregisterReason;

  @JsonKey(name: 'last_deregister_time')
  String? lastDeregisterTime;

  @JsonKey(name: 'pon_port_index')
  String? ponPortIndex;

  OnuDevice();

  factory OnuDevice.fromJson(Map<String, dynamic> json) =>
      _$OnuDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$OnuDeviceToJson(this);
}

@JsonSerializable()
class BoxCore {
  int? id;
  int? connection;

  @JsonKey(name: 'color_code')
  String? colorCode;

  @JsonKey(name: 'core_type')
  String? coreType;

  @JsonKey(name: 'group_color')
  String? groupColor;

  String? type;
  String? power;

  @JsonKey(name: 'power_drop')
  String? powerDrop;

  @JsonKey(name: 'on_lease')
  bool? onLease;

  @JsonKey(name: 'connected_color')
  String? connectedColor;

  @JsonKey(name: 'connected_group')
  String? connectedGroup;

  @JsonKey(name: 'connected_uuid')
  String? connectedUuid;

  @JsonKey(name: 'connected_connection')
  int? connectedConnection;

  @JsonKey(name: 'connected_boxcore')
  int? connectedBoxcore;

  String? description;

  BoxCore();

  factory BoxCore.fromJson(Map<String, dynamic> json) =>
      _$BoxCoreFromJson(json);
  Map<String, dynamic> toJson() => _$BoxCoreToJson(this);
}
