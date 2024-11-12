// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDeviceRequest _$UserDeviceRequestFromJson(Map<String, dynamic> json) =>
    UserDeviceRequest()
      ..id = (json['id'] as num?)?.toInt()
      ..user = (json['user'] as num?)?.toInt()
      ..serialNumber = json['serial_number'] as String?
      ..locationName = json['location_name'] as String?
      ..latitude = json['latitude'] as String?
      ..longitude = json['longitude'] as String?
      ..images =
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..item = (json['item'] as num?)?.toInt()
      ..itemName = json['item_name'] as String?
      ..itemIcon = json['item_icon'] as String?
      ..deviceIcon = json['device_icon'] as String?
      ..itemCategory = json['item_category'] as String?
      ..mac = json['mac'] as String?
      ..username = json['username'] as String?
      ..phone = json['phone'] as String?
      ..detail = json['detail'] as String?
      ..connections = (json['connections'] as List<dynamic>?)
          ?.map((e) => ConnectionRequest.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserDeviceRequestToJson(UserDeviceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'serial_number': instance.serialNumber,
      'location_name': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'images': instance.images,
      'item': instance.item,
      'item_name': instance.itemName,
      'item_icon': instance.itemIcon,
      'device_icon': instance.deviceIcon,
      'item_category': instance.itemCategory,
      'mac': instance.mac,
      'username': instance.username,
      'phone': instance.phone,
      'detail': instance.detail,
      'connections': instance.connections,
    };

ConnectionRequest _$ConnectionRequestFromJson(Map<String, dynamic> json) =>
    ConnectionRequest()
      ..id = (json['id'] as num?)?.toInt()
      ..device = (json['device'] as num?)?.toInt()
      ..serialNumber = json['serial_number'] as String?
      ..modelName = json['model_name'] as String?
      ..connectedDevice = (json['connected_device'] as num?)?.toInt()
      ..wire = (json['wire'] as num?)?.toInt()
      ..wireType = json['wire_type'] as String?
      ..wireName = json['wire_name'] as String?
      ..wireColor = json['wire_color'] as String?
      ..wireIcon = json['wire_icon'] as String?
      ..path = (json['path'] as List<dynamic>?)
          ?.map((e) => LatLngRequest.fromJson(e as Map<String, dynamic>))
          .toList()
      ..power = json['power'] as String?
      ..powerDrop = json['power_drop'] as String?
      ..onuPppoes = (json['onu_pppoes'] as List<dynamic>?)
          ?.map((e) => OnuPppoeRequest.fromJson(e as Map<String, dynamic>))
          .toList()
      ..onuDevice = (json['onu_device'] as List<dynamic>?)
          ?.map((e) => OnuDeviceRequest.fromJson(e as Map<String, dynamic>))
          .toList()
      ..details = json['details'] as String?
      ..distance = json['distance'] as String?
      ..loop = json['loop'] as String?
      ..loops = (json['loops'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..loopDesc = (json['loop_desc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..uniqueId = json['unique_id'] as String?
      ..boxCores = (json['boxcores'] as List<dynamic>?)
          ?.map((e) => BoxCoreRequest.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wireCode = json['wire_code'] as String?
      ..wireMode = json['wire_mode'] as String?
      ..mac = json['mac'] as String?;

Map<String, dynamic> _$ConnectionRequestToJson(ConnectionRequest instance) =>
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
      'wire_icon': instance.wireIcon,
      'path': instance.path,
      'power': instance.power,
      'power_drop': instance.powerDrop,
      'onu_pppoes': instance.onuPppoes,
      'onu_device': instance.onuDevice,
      'details': instance.details,
      'distance': instance.distance,
      'loop': instance.loop,
      'loops': instance.loops,
      'loop_desc': instance.loopDesc,
      'unique_id': instance.uniqueId,
      'boxcores': instance.boxCores,
      'wire_code': instance.wireCode,
      'wire_mode': instance.wireMode,
      'mac': instance.mac,
    };

LatLngRequest _$LatLngRequestFromJson(Map<String, dynamic> json) =>
    LatLngRequest(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LatLngRequestToJson(LatLngRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

OnuPppoeRequest _$OnuPppoeRequestFromJson(Map<String, dynamic> json) =>
    OnuPppoeRequest()
      ..id = (json['id'] as num?)?.toInt()
      ..pppoeId = json['pppoe_id'] as String?
      ..pppoeName = json['pppoe_name'] as String?
      ..active = json['active'] as bool?
      ..name = json['name'] as String?
      ..username = json['username'] as String?
      ..phoneNumber = json['phone_number'] as String?
      ..macAddress = json['mac_address'] as String?
      ..crmLink = json['crm_link'] as String?
      ..pppoeData = json['pppoe_data'] == null
          ? null
          : PppoeDataRequest.fromJson(
              json['pppoe_data'] as Map<String, dynamic>);

Map<String, dynamic> _$OnuPppoeRequestToJson(OnuPppoeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pppoe_id': instance.pppoeId,
      'pppoe_name': instance.pppoeName,
      'active': instance.active,
      'name': instance.name,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'mac_address': instance.macAddress,
      'crm_link': instance.crmLink,
      'pppoe_data': instance.pppoeData,
    };

PppoeDataRequest _$PppoeDataRequestFromJson(Map<String, dynamic> json) =>
    PppoeDataRequest()
      ..mtu = json['mtu'] as String?
      ..type = json['type'] as String?
      ..isDynamic = json['dynamic'] as String?
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

Map<String, dynamic> _$PppoeDataRequestToJson(PppoeDataRequest instance) =>
    <String, dynamic>{
      'mtu': instance.mtu,
      'type': instance.type,
      'dynamic': instance.isDynamic,
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

OnuDeviceRequest _$OnuDeviceRequestFromJson(Map<String, dynamic> json) =>
    OnuDeviceRequest()
      ..id = (json['id'] as num?)?.toInt()
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
      ..ponPortIndex = json['pon_port_index'] as String?;

Map<String, dynamic> _$OnuDeviceRequestToJson(OnuDeviceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'pon_port_index': instance.ponPortIndex,
    };

BoxCoreRequest _$BoxCoreRequestFromJson(Map<String, dynamic> json) =>
    BoxCoreRequest()
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
      ..connectedBoxcore = (json['connected_boxcore'] as num?)?.toInt()
      ..description = json['description'] as String?;

Map<String, dynamic> _$BoxCoreRequestToJson(BoxCoreRequest instance) =>
    <String, dynamic>{
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
      'connected_boxcore': instance.connectedBoxcore,
      'description': instance.description,
    };
