import 'package:json_annotation/json_annotation.dart';

part 'device_and_wire_report_model.g.dart';

@JsonSerializable()
class DeviceAndWireReport {
  Device? device;
  Wire? wire;

  DeviceAndWireReport();

  factory DeviceAndWireReport.fromJson(Map<String, dynamic> json) =>
      _$DeviceAndWireReportFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceAndWireReportToJson(this);
}

@JsonSerializable()
class Device {
  int? total;
  List<DeviceItem>? devices;

  Device();

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class DeviceItem {
  int? id;
  String? name;
  int? count;

  DeviceItem();

  factory DeviceItem.fromJson(Map<String, dynamic> json) =>
      _$DeviceItemFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceItemToJson(this);
}

@JsonSerializable()
class Wire {
  double? total;
  List<WireItem>? wires;

  Wire();

  factory Wire.fromJson(Map<String, dynamic> json) => _$WireFromJson(json);
  Map<String, dynamic> toJson() => _$WireToJson(this);
}

@JsonSerializable()
class WireItem {
  int? id;
  String? name;
  double? distance;

  WireItem();

  factory WireItem.fromJson(Map<String, dynamic> json) =>
      _$WireItemFromJson(json);
  Map<String, dynamic> toJson() => _$WireItemToJson(this);
}
