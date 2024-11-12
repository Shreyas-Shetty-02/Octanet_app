import 'package:json_annotation/json_annotation.dart';
part 'active_pppoe_model.g.dart';

@JsonSerializable()
class ActivePPPOE {
  @JsonKey(name: 'active_pppoe_count')
  int? activePPPOECount;

  @JsonKey(name: 'all_pppoe_count')
  int? allPPPOECount;

  ActivePPPOE({
    this.activePPPOECount,
    this.allPPPOECount,
  });

  factory ActivePPPOE.fromJson(Map<String, dynamic> json) =>
      _$ActivePPPOEFromJson(json);

  Map<String, dynamic> toJson() => _$ActivePPPOEToJson(this);
}
