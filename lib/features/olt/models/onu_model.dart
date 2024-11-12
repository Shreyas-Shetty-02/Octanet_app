import 'package:json_annotation/json_annotation.dart';

part 'onu_model.g.dart';

@JsonSerializable()
class ONUResponse {
  int? id;

  @JsonKey(name: 'linked_onu')
  LinkedOnu? linkedOnu;

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

  @JsonKey(name: 'distance')
  String? distance;

  @JsonKey(name: 'temperature')
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

  @JsonKey(name: 'olt_name')
  String? oltName;

  @JsonKey(name: 'pon_port_index')
  String? ponPortIndex;

  @JsonKey(name: 'last_updated')
  String? lastUpdated;

  ONUResponse();

  factory ONUResponse.fromJson(Map<String, dynamic> json) =>
      _$ONUResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ONUResponseToJson(this);
}

@JsonSerializable()
class LinkedOnu {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'device')
  Device? device;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'model_name')
  String? modelName;

  @JsonKey(name: 'wire')
  int? wire;

  @JsonKey(name: 'wire_type')
  String? wireType;

  @JsonKey(name: 'wire_name')
  String? wireName;

  @JsonKey(name: 'wire_color')
  String? wireColor;

  @JsonKey(name: 'wire_icon')
  String? wireIcon;

  @JsonKey(name: 'mac')
  String? mac;

  @JsonKey(name: 'wire_code')
  String? wireCode;

  @JsonKey(name: 'wire_mode')
  String? wireMode;

  LinkedOnu();

  factory LinkedOnu.fromJson(Map<String, dynamic> json) =>
      _$LinkedOnuFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedOnuToJson(this);
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
