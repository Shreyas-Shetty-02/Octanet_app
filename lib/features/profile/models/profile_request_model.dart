import 'package:Octanet/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_request_model.g.dart';

@JsonSerializable()
class ProfileRequest extends BaseModel {
  @JsonKey(name: 'owner_name')
  String ownerName;

  @JsonKey(name: 'company_name')
  String companyName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'address_line1')
  String addressLine1;

  @JsonKey(name: 'address_line2')
  String addressLine2;

  @JsonKey(name: 'pin_code')
  String pinCode;

  @JsonKey(name: 'city_id')
  int cityId;

  @JsonKey(name: 'district_id')
  int districtId;

  @JsonKey(name: 'state_id')
  int stateId;

  String country;

  ProfileRequest(
      {required this.ownerName,
      required this.companyName,
      required this.email,
      required this.phoneNumber,
      required this.addressLine1,
      required this.addressLine2,
      required this.pinCode,
      required this.cityId,
      required this.districtId,
      required this.stateId,
      required this.country});

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestToJson(this);
}
