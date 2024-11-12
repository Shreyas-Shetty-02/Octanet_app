// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_wire_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterWireModel _$MasterWireModelFromJson(Map<String, dynamic> json) =>
    MasterWireModel()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..type = json['type'] as String?
      ..sizeType = json['size_type'] as String?
      ..inCount = json['in_count'] as String?
      ..outCount = json['out_count'] as String?
      ..wireColor = json['wire_color'] as String?
      ..icon = json['icon'] as String?
      ..inColors = (json['in_colors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..outColors = (json['out_colors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..powerDrop = json['power_drop'] as String?
      ..corePowerDrop = (json['core_power_drop'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$MasterWireModelToJson(MasterWireModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'size_type': instance.sizeType,
      'in_count': instance.inCount,
      'out_count': instance.outCount,
      'wire_color': instance.wireColor,
      'icon': instance.icon,
      'in_colors': instance.inColors,
      'out_colors': instance.outColors,
      'power_drop': instance.powerDrop,
      'core_power_drop': instance.corePowerDrop,
    };
