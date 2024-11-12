import 'package:json_annotation/json_annotation.dart';
part 'forgot_response.g.dart';

@JsonSerializable()
class ForgotResponse {
  String? email;
  String? status;

  ForgotResponse({this.email, this.status});

  factory ForgotResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotResponseToJson(this);
}
