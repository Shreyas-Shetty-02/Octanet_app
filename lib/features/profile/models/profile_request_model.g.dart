// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) =>
    ProfileRequest(
      ownerName: json['owner_name'] as String,
      companyName: json['company_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      addressLine1: json['address_line1'] as String,
      addressLine2: json['address_line2'] as String,
      pinCode: json['pin_code'] as String,
      cityId: (json['city_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      stateId: (json['state_id'] as num).toInt(),
      country: json['country'] as String,
    )..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$ProfileRequestToJson(ProfileRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.ownerName,
      'company_name': instance.companyName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'pin_code': instance.pinCode,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'state_id': instance.stateId,
      'country': instance.country,
    };
