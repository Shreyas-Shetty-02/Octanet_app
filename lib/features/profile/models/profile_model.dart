import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileResponse {
  int? id;

  @JsonKey(name: 'profile_photo')
  String? profilePhoto;

  @JsonKey(name: 'owner_name')
  String? ownerName;

  @JsonKey(name: 'company_name')
  String? companyName;

  String? email;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'address_line1')
  String? addressLine1;

  @JsonKey(name: 'address_line2')
  String? addressLine2;

  @JsonKey(name: 'pin_code')
  String? pinCode;

  @JsonKey(name: 'city_id')
  int? cityId;

  @JsonKey(name: 'district_id')
  int? districtId;

  @JsonKey(name: 'state_id')
  int? stateId;

  String? country;

  ProfileResponse();

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
