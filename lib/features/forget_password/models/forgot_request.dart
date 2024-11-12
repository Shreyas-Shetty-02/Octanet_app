import 'package:Octanet/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forgot_request.g.dart';

@JsonSerializable()
class ForgotRequest extends BaseModel {
  String? email;

  ForgotRequest({this.email});

  factory ForgotRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForgotRequestToJson(this);
}
