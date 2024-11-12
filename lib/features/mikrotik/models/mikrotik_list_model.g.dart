// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mikrotik_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MikrotikList _$MikrotikListFromJson(Map<String, dynamic> json) => MikrotikList()
  ..id = (json['id'] as num?)?.toInt()
  ..ipAddress = json['ip_address'] as String?
  ..mikrotikData = json['mikrotik_data'] == null
      ? null
      : MikrotikData.fromJson(json['mikrotik_data'] as Map<String, dynamic>)
  ..activePppoes = (json['active_pppoes'] as num?)?.toInt()
  ..allPppoes = (json['all_pppoes'] as num?)?.toInt()
  ..updatedAt = json['updated_at'] as String?
  ..handledBy = json['handled_by'] as String?
  ..companyUserId = (json['company_user_id'] as num?)?.toInt();

Map<String, dynamic> _$MikrotikListToJson(MikrotikList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ip_address': instance.ipAddress,
      'mikrotik_data': instance.mikrotikData,
      'active_pppoes': instance.activePppoes,
      'all_pppoes': instance.allPppoes,
      'updated_at': instance.updatedAt,
      'handled_by': instance.handledBy,
      'company_user_id': instance.companyUserId,
    };

MikrotikData _$MikrotikDataFromJson(Map<String, dynamic> json) => MikrotikData()
  ..cpu = json['cpu'] as String?
  ..uptime = json['uptime'] as String?
  ..version = json['version'] as String?
  ..cpuLoad = json['cpu_load'] as String?
  ..platform = json['platform'] as String?
  ..cpuCount = json['cpu_count'] as String?
  ..boardName = json['board_name'] as String?
  ..buildTime = json['build_time'] as String?
  ..freeMemory = json['free_memory'] as String?
  ..totalMemory = json['total_memory'] as String?
  ..cpuFrequency = json['cpu_frequency'] as String?
  ..freeHddSpace = json['free_hdd_space'] as String?
  ..totalHddSpace = json['total_hdd_space'] as String?
  ..writeSectTotal = json['write_sect_total'] as String?
  ..architectureName = json['architecture_name'] as String?
  ..writeSectSinceReboot = json['write_sect_since_reboot'] as String?;

Map<String, dynamic> _$MikrotikDataToJson(MikrotikData instance) =>
    <String, dynamic>{
      'cpu': instance.cpu,
      'uptime': instance.uptime,
      'version': instance.version,
      'cpu_load': instance.cpuLoad,
      'platform': instance.platform,
      'cpu_count': instance.cpuCount,
      'board_name': instance.boardName,
      'build_time': instance.buildTime,
      'free_memory': instance.freeMemory,
      'total_memory': instance.totalMemory,
      'cpu_frequency': instance.cpuFrequency,
      'free_hdd_space': instance.freeHddSpace,
      'total_hdd_space': instance.totalHddSpace,
      'write_sect_total': instance.writeSectTotal,
      'architecture_name': instance.architectureName,
      'write_sect_since_reboot': instance.writeSectSinceReboot,
    };
