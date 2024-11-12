import 'package:json_annotation/json_annotation.dart';

part 'master_item_model.g.dart';

@JsonSerializable()
class MasterItem {
  int? id;
  String? name;
  String? type;
  String? category;
  String? icon;

  @JsonKey(name: 'device_icon')
  String? deviceIcon;

  @JsonKey(name: 'description')
  String? description;

  MasterItem();

  factory MasterItem.fromJson(Map<String, dynamic> json) =>
      _$MasterItemFromJson(json);

  Map<String, dynamic> toJson() => _$MasterItemToJson(this);
}
