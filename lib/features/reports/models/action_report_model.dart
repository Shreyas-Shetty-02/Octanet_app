import 'package:json_annotation/json_annotation.dart';

part 'action_report_model.g.dart';

@JsonSerializable()
class ActionReport {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'created_by')
  int? createdBy;

  @JsonKey(name: 'created_at')
  String? createdAt;

  Changes? changes;
  String? action;
  Device? device;

  @JsonKey(name: 'action_by')
  String? actionBy;

  @JsonKey(name: 'device_name')
  String? deviceName;

  String? reference;

  @JsonKey(name: 'audit_connections')
  List<AuditConnection>? auditConnections;

  ActionReport();

  factory ActionReport.fromJson(Map<String, dynamic> json) =>
      _$ActionReportFromJson(json);

  Map<String, dynamic> toJson() => _$ActionReportToJson(this);
}

@JsonSerializable()
class Changes {
  @JsonKey(name: 'new')
  Map<String, dynamic>? newValues;

  @JsonKey(name: 'old')
  Map<String, dynamic>? oldValues;

  Changes();

  factory Changes.fromJson(Map<String, dynamic> json) =>
      _$ChangesFromJson(json);

  Map<String, dynamic> toJson() => _$ChangesToJson(this);
}

@JsonSerializable()
class Device {
  int? id;
  int? user;

  @JsonKey(name: 'serial_number')
  String? serialNumber;

  @JsonKey(name: 'location_name')
  String? locationName;

  String? latitude;
  String? longitude;
  int? item;

  @JsonKey(name: 'item_name')
  String? itemName;

  @JsonKey(name: 'item_icon')
  String? itemIcon;

  String? mac;
  String? username;
  String? phone;
  String? detail;

  Device();

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class AuditConnection {
  int? id;

  @JsonKey(name: 'created_by')
  int? createdBy;

  @JsonKey(name: 'created_at')
  String? createdAt;

  Changes? changes;
  String? action;

  @JsonKey(name: 'audit_boxcore')
  List<AuditBoxCore>? auditBoxCore;

  Connection? connection;

  @JsonKey(name: 'connected_device_name')
  String? connectedDeviceName;

  @JsonKey(name: 'action_by')
  String? actionBy;

  AuditConnection();

  factory AuditConnection.fromJson(Map<String, dynamic> json) =>
      _$AuditConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$AuditConnectionToJson(this);
}

@JsonSerializable()
class AuditBoxCore {
  int? id;

  @JsonKey(name: 'created_by')
  int? createdBy;

  @JsonKey(name: 'created_at')
  String? createdAt;

  Changes? changes;
  String? action;

  @JsonKey(name: 'box_core')
  BoxCore? boxCore;

  @JsonKey(name: 'action_by')
  String? actionBy;

  AuditBoxCore();

  factory AuditBoxCore.fromJson(Map<String, dynamic> json) =>
      _$AuditBoxCoreFromJson(json);

  Map<String, dynamic> toJson() => _$AuditBoxCoreToJson(this);
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
  String? connectedBoxCore;

  BoxCore();

  factory BoxCore.fromJson(Map<String, dynamic> json) =>
      _$BoxCoreFromJson(json);

  Map<String, dynamic> toJson() => _$BoxCoreToJson(this);
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

  List<Map<String, dynamic>>? path;

  @JsonKey(name: 'loop_desc')
  List<String>? loopDesc;

  String? power;

  @JsonKey(name: 'power_drop')
  String? powerDrop;

  String? details;
  String? distance;
  String? loop;
  List<int>? loops;

  @JsonKey(name: 'unique_id')
  String? uniqueId;

  @JsonKey(name: 'wire_code')
  String? wireCode;

  @JsonKey(name: 'wire_mode')
  String? wireMode;

  Connection();

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
