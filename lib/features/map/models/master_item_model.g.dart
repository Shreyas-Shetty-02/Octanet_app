// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterItem _$MasterItemFromJson(Map<String, dynamic> json) => MasterItem()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..type = json['type'] as String?
  ..category = json['category'] as String?
  ..icon = json['icon'] as String?
  ..deviceIcon = json['device_icon'] as String?
  ..description = json['description'] as String?;

Map<String, dynamic> _$MasterItemToJson(MasterItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'icon': instance.icon,
      'device_icon': instance.deviceIcon,
      'description': instance.description,
    };
