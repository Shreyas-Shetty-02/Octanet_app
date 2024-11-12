// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PincodeResponse _$PincodeResponseFromJson(Map<String, dynamic> json) =>
    PincodeResponse()
      ..pinCode = json['pin_code'] as String?
      ..districtName = json['district_name'] as String?
      ..stateName = json['state_name'] as String?
      ..cityName = (json['city_name'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList()
      ..countryName = json['country_name'] as String?
      ..pinId = (json['pin_id'] as num?)?.toInt()
      ..districtId = (json['district_id'] as num?)?.toInt()
      ..stateId = (json['state_id'] as num?)?.toInt();

Map<String, dynamic> _$PincodeResponseToJson(PincodeResponse instance) =>
    <String, dynamic>{
      'pin_code': instance.pinCode,
      'district_name': instance.districtName,
      'state_name': instance.stateName,
      'city_name': instance.cityName,
      'country_name': instance.countryName,
      'pin_id': instance.pinId,
      'district_id': instance.districtId,
      'state_id': instance.stateId,
    };

City _$CityFromJson(Map<String, dynamic> json) => City()
  ..cityId = (json['city_id'] as num?)?.toInt()
  ..cityName = json['city_name'] as String?;

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'city_id': instance.cityId,
      'city_name': instance.cityName,
    };
