import 'package:json_annotation/json_annotation.dart';

part 'pincode_model.g.dart';

@JsonSerializable()
class PincodeResponse {
  @JsonKey(name: 'pin_code')
  String? pinCode;

  @JsonKey(name: 'district_name')
  String? districtName;

  @JsonKey(name: 'state_name')
  String? stateName;

  @JsonKey(name: 'city_name')
  List<City>? cityName;

  @JsonKey(name: 'country_name')
  String? countryName;

  @JsonKey(name: 'pin_id')
  int? pinId;

  @JsonKey(name: 'district_id')
  int? districtId;

  @JsonKey(name: 'state_id')
  int? stateId;

  PincodeResponse();

  factory PincodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PincodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PincodeResponseToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'city_name')
  String? cityName;

  City();

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
