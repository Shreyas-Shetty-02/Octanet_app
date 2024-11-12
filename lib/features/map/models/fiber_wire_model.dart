import 'package:json_annotation/json_annotation.dart';

part 'fiber_wire_model.g.dart';

@JsonSerializable()
class FiberModel {
  int? id;
  String? name;
  String? type;

  @JsonKey(name: 'size_type')
  String? sizeType;

  @JsonKey(name: 'in_count')
  String? inCount;

  @JsonKey(name: 'out_count')
  String? outCount;

  @JsonKey(name: 'wire_color')
  String? wireColor;
  String? icon;

  @JsonKey(name: 'in_color')
  List<String>? inColors;

  @JsonKey(name: 'out_color')
  List<String>? outColors;

  @JsonKey(name: 'power_drop')
  String? powerDrop;

  @JsonKey(name: 'core_power_drop')
  List<int>? corePowerDrop;

  FiberModel();

  factory FiberModel.fromJson(Map<String, dynamic> json) =>
      _$FiberModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiberModelToJson(this);
}
