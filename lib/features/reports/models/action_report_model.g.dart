// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionReport _$ActionReportFromJson(Map<String, dynamic> json) => ActionReport()
  ..id = (json['id'] as num?)?.toInt()
  ..createdBy = (json['created_by'] as num?)?.toInt()
  ..createdAt = json['created_at'] as String?
  ..changes = json['changes'] == null
      ? null
      : Changes.fromJson(json['changes'] as Map<String, dynamic>)
  ..action = json['action'] as String?
  ..device = json['device'] == null
      ? null
      : Device.fromJson(json['device'] as Map<String, dynamic>)
  ..actionBy = json['action_by'] as String?
  ..deviceName = json['device_name'] as String?
  ..reference = json['reference'] as String?
  ..auditConnections = (json['audit_connections'] as List<dynamic>?)
      ?.map((e) => AuditConnection.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ActionReportToJson(ActionReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'changes': instance.changes,
      'action': instance.action,
      'device': instance.device,
      'action_by': instance.actionBy,
      'device_name': instance.deviceName,
      'reference': instance.reference,
      'audit_connections': instance.auditConnections,
    };

Changes _$ChangesFromJson(Map<String, dynamic> json) => Changes()
  ..newValues = json['new'] as Map<String, dynamic>?
  ..oldValues = json['old'] as Map<String, dynamic>?;

Map<String, dynamic> _$ChangesToJson(Changes instance) => <String, dynamic>{
      'new': instance.newValues,
      'old': instance.oldValues,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device()
  ..id = (json['id'] as num?)?.toInt()
  ..user = (json['user'] as num?)?.toInt()
  ..serialNumber = json['serial_number'] as String?
  ..locationName = json['location_name'] as String?
  ..latitude = json['latitude'] as String?
  ..longitude = json['longitude'] as String?
  ..item = (json['item'] as num?)?.toInt()
  ..itemName = json['item_name'] as String?
  ..itemIcon = json['item_icon'] as String?
  ..mac = json['mac'] as String?
  ..username = json['username'] as String?
  ..phone = json['phone'] as String?
  ..detail = json['detail'] as String?;

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'serial_number': instance.serialNumber,
      'location_name': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'item': instance.item,
      'item_name': instance.itemName,
      'item_icon': instance.itemIcon,
      'mac': instance.mac,
      'username': instance.username,
      'phone': instance.phone,
      'detail': instance.detail,
    };

AuditConnection _$AuditConnectionFromJson(Map<String, dynamic> json) =>
    AuditConnection()
      ..id = (json['id'] as num?)?.toInt()
      ..createdBy = (json['created_by'] as num?)?.toInt()
      ..createdAt = json['created_at'] as String?
      ..changes = json['changes'] == null
          ? null
          : Changes.fromJson(json['changes'] as Map<String, dynamic>)
      ..action = json['action'] as String?
      ..auditBoxCore = (json['audit_boxcore'] as List<dynamic>?)
          ?.map((e) => AuditBoxCore.fromJson(e as Map<String, dynamic>))
          .toList()
      ..connection = json['connection'] == null
          ? null
          : Connection.fromJson(json['connection'] as Map<String, dynamic>)
      ..connectedDeviceName = json['connected_device_name'] as String?
      ..actionBy = json['action_by'] as String?;

Map<String, dynamic> _$AuditConnectionToJson(AuditConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'changes': instance.changes,
      'action': instance.action,
      'audit_boxcore': instance.auditBoxCore,
      'connection': instance.connection,
      'connected_device_name': instance.connectedDeviceName,
      'action_by': instance.actionBy,
    };

AuditBoxCore _$AuditBoxCoreFromJson(Map<String, dynamic> json) => AuditBoxCore()
  ..id = (json['id'] as num?)?.toInt()
  ..createdBy = (json['created_by'] as num?)?.toInt()
  ..createdAt = json['created_at'] as String?
  ..changes = json['changes'] == null
      ? null
      : Changes.fromJson(json['changes'] as Map<String, dynamic>)
  ..action = json['action'] as String?
  ..boxCore = json['box_core'] == null
      ? null
      : BoxCore.fromJson(json['box_core'] as Map<String, dynamic>)
  ..actionBy = json['action_by'] as String?;

Map<String, dynamic> _$AuditBoxCoreToJson(AuditBoxCore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'changes': instance.changes,
      'action': instance.action,
      'box_core': instance.boxCore,
      'action_by': instance.actionBy,
    };

BoxCore _$BoxCoreFromJson(Map<String, dynamic> json) => BoxCore()
  ..id = (json['id'] as num?)?.toInt()
  ..connection = (json['connection'] as num?)?.toInt()
  ..colorCode = json['color_code'] as String?
  ..coreType = json['core_type'] as String?
  ..groupColor = json['group_color'] as String?
  ..type = json['type'] as String?
  ..power = json['power'] as String?
  ..powerDrop = json['power_drop'] as String?
  ..onLease = json['on_lease'] as bool?
  ..connectedColor = json['connected_color'] as String?
  ..connectedGroup = json['connected_group'] as String?
  ..connectedUuid = json['connected_uuid'] as String?
  ..connectedConnection = (json['connected_connection'] as num?)?.toInt()
  ..connectedBoxCore = json['connected_boxcore'] as String?;

Map<String, dynamic> _$BoxCoreToJson(BoxCore instance) => <String, dynamic>{
      'id': instance.id,
      'connection': instance.connection,
      'color_code': instance.colorCode,
      'core_type': instance.coreType,
      'group_color': instance.groupColor,
      'type': instance.type,
      'power': instance.power,
      'power_drop': instance.powerDrop,
      'on_lease': instance.onLease,
      'connected_color': instance.connectedColor,
      'connected_group': instance.connectedGroup,
      'connected_uuid': instance.connectedUuid,
      'connected_connection': instance.connectedConnection,
      'connected_boxcore': instance.connectedBoxCore,
    };

Connection _$ConnectionFromJson(Map<String, dynamic> json) => Connection()
  ..id = (json['id'] as num?)?.toInt()
  ..device = (json['device'] as num?)?.toInt()
  ..serialNumber = json['serial_number'] as String?
  ..modelName = json['model_name'] as String?
  ..connectedDevice = (json['connected_device'] as num?)?.toInt()
  ..wire = (json['wire'] as num?)?.toInt()
  ..wireType = json['wire_type'] as String?
  ..wireName = json['wire_name'] as String?
  ..wireColor = json['wire_color'] as String?
  ..path = (json['path'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList()
  ..loopDesc =
      (json['loop_desc'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..power = json['power'] as String?
  ..powerDrop = json['power_drop'] as String?
  ..details = json['details'] as String?
  ..distance = json['distance'] as String?
  ..loop = json['loop'] as String?
  ..loops =
      (json['loops'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList()
  ..uniqueId = json['unique_id'] as String?
  ..wireCode = json['wire_code'] as String?
  ..wireMode = json['wire_mode'] as String?;

Map<String, dynamic> _$ConnectionToJson(Connection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device': instance.device,
      'serial_number': instance.serialNumber,
      'model_name': instance.modelName,
      'connected_device': instance.connectedDevice,
      'wire': instance.wire,
      'wire_type': instance.wireType,
      'wire_name': instance.wireName,
      'wire_color': instance.wireColor,
      'path': instance.path,
      'loop_desc': instance.loopDesc,
      'power': instance.power,
      'power_drop': instance.powerDrop,
      'details': instance.details,
      'distance': instance.distance,
      'loop': instance.loop,
      'loops': instance.loops,
      'unique_id': instance.uniqueId,
      'wire_code': instance.wireCode,
      'wire_mode': instance.wireMode,
    };
