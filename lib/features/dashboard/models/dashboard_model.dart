import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardResponse {
  Device? device;
  Wire? wire;
  Olt? olt;
  Onu? onu;

  @JsonKey(name: 'mikrotik_ip')
  String? mikrotikIp;

  @JsonKey(name: 'mikrotik_data')
  MikrotikData? mikrotikData;
  Operator? operator;

  DashboardResponse();

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);
}

@JsonSerializable()
class Device {
  int total;
  List<DeviceDetail> devices;

  Device({required this.total, required this.devices});

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class DeviceDetail {
  String name;
  int count;
  int id;

  DeviceDetail({required this.name, required this.count, required this.id});

  factory DeviceDetail.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDetailToJson(this);
}

@JsonSerializable()
class Wire {
  int total;
  List<WireDetail> wires;

  Wire({required this.total, required this.wires});

  factory Wire.fromJson(Map<String, dynamic> json) => _$WireFromJson(json);

  Map<String, dynamic> toJson() => _$WireToJson(this);
}

@JsonSerializable()
class WireDetail {
  String name;
  int distance;
  int id;

  WireDetail({required this.name, required this.distance, required this.id});

  factory WireDetail.fromJson(Map<String, dynamic> json) =>
      _$WireDetailFromJson(json);

  Map<String, dynamic> toJson() => _$WireDetailToJson(this);
}

@JsonSerializable()
class Olt {
  int total;

  Olt({required this.total});

  factory Olt.fromJson(Map<String, dynamic> json) => _$OltFromJson(json);

  Map<String, dynamic> toJson() => _$OltToJson(this);
}

@JsonSerializable()
class Onu {
  int total;
  int active;
  int inactive;
  int down;

  Onu(
      {required this.total,
      required this.active,
      required this.inactive,
      required this.down});

  factory Onu.fromJson(Map<String, dynamic> json) => _$OnuFromJson(json);

  Map<String, dynamic> toJson() => _$OnuToJson(this);
}

@JsonSerializable()
class MikrotikData {
  String uptime;

  @JsonKey(name: 'cpu_load')
  String cpuLoad;

  @JsonKey(name: 'free_memory')
  String freeMemory;

  @JsonKey(name: 'total_memory')
  String totalMemory;

  @JsonKey(name: 'free_hdd_space')
  String freeHddSpace;

  @JsonKey(name: 'total_hdd_space')
  String totalHddSpace;

  MikrotikData({
    required this.uptime,
    required this.cpuLoad,
    required this.freeMemory,
    required this.totalMemory,
    required this.freeHddSpace,
    required this.totalHddSpace,
  });

  factory MikrotikData.fromJson(Map<String, dynamic> json) =>
      _$MikrotikDataFromJson(json);

  Map<String, dynamic> toJson() => _$MikrotikDataToJson(this);
}

@JsonSerializable()
class Operator {
  String noOperators;
  int? noArea;
  int? noDevices;

  Operator({required this.noOperators, this.noArea, this.noDevices});

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}
