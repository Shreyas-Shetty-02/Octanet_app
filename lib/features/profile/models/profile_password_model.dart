import 'package:json_annotation/json_annotation.dart';

part 'profile_password_model.g.dart';

@JsonSerializable()
class ProfilePass {
  String oldpass;
  String newpass;
  String confirmpass;

  ProfilePass({
    required this.oldpass,
    required this.newpass,
    required this.confirmpass,
  });

  factory ProfilePass.fromJson(Map<String, dynamic> json) =>
      _$ProfilePassFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePassToJson(this);
}
