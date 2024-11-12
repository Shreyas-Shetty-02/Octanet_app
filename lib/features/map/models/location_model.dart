import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class Location {
  int? id;
  int? user;
  int? area;
  List<Polygon>? polygon;

  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Polygon {
  double? lat;
  double? lng;

  Polygon();

  factory Polygon.fromJson(Map<String, dynamic> json) =>
      _$PolygonFromJson(json);
  Map<String, dynamic> toJson() => _$PolygonToJson(this);
}
