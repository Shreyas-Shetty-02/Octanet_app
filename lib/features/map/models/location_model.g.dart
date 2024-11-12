// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location()
  ..id = (json['id'] as num?)?.toInt()
  ..user = (json['user'] as num?)?.toInt()
  ..area = (json['area'] as num?)?.toInt()
  ..polygon = (json['polygon'] as List<dynamic>?)
      ?.map((e) => Polygon.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'area': instance.area,
      'polygon': instance.polygon,
    };

Polygon _$PolygonFromJson(Map<String, dynamic> json) => Polygon()
  ..lat = (json['lat'] as num?)?.toDouble()
  ..lng = (json['lng'] as num?)?.toDouble();

Map<String, dynamic> _$PolygonToJson(Polygon instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
