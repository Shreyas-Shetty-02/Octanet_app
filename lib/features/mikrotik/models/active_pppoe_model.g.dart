// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_pppoe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivePPPOE _$ActivePPPOEFromJson(Map<String, dynamic> json) => ActivePPPOE(
      activePPPOECount: (json['active_pppoe_count'] as num?)?.toInt(),
      allPPPOECount: (json['all_pppoe_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActivePPPOEToJson(ActivePPPOE instance) =>
    <String, dynamic>{
      'active_pppoe_count': instance.activePPPOECount,
      'all_pppoe_count': instance.allPPPOECount,
    };
