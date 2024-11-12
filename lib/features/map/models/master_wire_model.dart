import 'package:json_annotation/json_annotation.dart';

part 'master_wire_model.g.dart';

@JsonSerializable()
class MasterWireModel {
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

  @JsonKey(name: 'in_colors')
  List<String>? inColors;

  @JsonKey(name: 'out_colors')
  List<String>? outColors;

  @JsonKey(name: 'power_drop')
  String? powerDrop;

  @JsonKey(name: 'core_power_drop')
  List<double>? corePowerDrop;

  MasterWireModel();

  factory MasterWireModel.fromJson(Map<String, dynamic> json) =>
      _$MasterWireModelFromJson(json);
  Map<String?, dynamic> toJson() => _$MasterWireModelToJson(this);
}
