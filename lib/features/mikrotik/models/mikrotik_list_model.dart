import 'package:json_annotation/json_annotation.dart';

part 'mikrotik_list_model.g.dart';

@JsonSerializable()
class MikrotikList {
  int? id;

  @JsonKey(name: 'ip_address')
  String? ipAddress;

  @JsonKey(name: 'mikrotik_data')
  MikrotikData? mikrotikData;

  @JsonKey(name: 'active_pppoes')
  int? activePppoes;

  @JsonKey(name: 'all_pppoes')
  int? allPppoes;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'handled_by')
  String? handledBy;

  @JsonKey(name: 'company_user_id')
  int? companyUserId;

  MikrotikList();

  factory MikrotikList.fromJson(Map<String, dynamic> json) =>
      _$MikrotikListFromJson(json);
  Map<String, dynamic> toJson() => _$MikrotikListToJson(this);
}

@JsonSerializable()
class MikrotikData {
  String? cpu;
  String? uptime;
  String? version;

  @JsonKey(name: 'cpu_load')
  String? cpuLoad;

  String? platform;

  @JsonKey(name: 'cpu_count')
  String? cpuCount;

  @JsonKey(name: 'board_name')
  String? boardName;

  @JsonKey(name: 'build_time')
  String? buildTime;

  @JsonKey(name: 'free_memory')
  String? freeMemory;

  @JsonKey(name: 'total_memory')
  String? totalMemory;

  @JsonKey(name: 'cpu_frequency')
  String? cpuFrequency;

  @JsonKey(name: 'free_hdd_space')
  String? freeHddSpace;

  @JsonKey(name: 'total_hdd_space')
  String? totalHddSpace;

  @JsonKey(name: 'write_sect_total')
  String? writeSectTotal;

  @JsonKey(name: 'architecture_name')
  String? architectureName;

  @JsonKey(name: 'write_sect_since_reboot')
  String? writeSectSinceReboot;

  MikrotikData();

  factory MikrotikData.fromJson(Map<String, dynamic> json) =>
      _$MikrotikDataFromJson(json);
  Map<String, dynamic> toJson() => _$MikrotikDataToJson(this);
}
