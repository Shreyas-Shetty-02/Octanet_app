import 'package:json_annotation/json_annotation.dart';
part 'query_links_model.g.dart';

@JsonSerializable()
class QueryLinks {
  int? id;
  String? name;

  @JsonKey(name: 'related_videos')
  List<RelatedVideos>? relatedVideos;

  QueryLinks({
    this.id,
    this.name,
    this.relatedVideos,
  });

  factory QueryLinks.fromJson(Map<String, dynamic> json) =>
      _$QueryLinksFromJson(json);

  Map<String, dynamic> toJson() => _$QueryLinksToJson(this);
}

@JsonSerializable()
class RelatedVideos {
  int? id;
  String? name;
  String? link;

  RelatedVideos({this.id, this.name, this.link});

  factory RelatedVideos.fromJson(Map<String, dynamic> json) =>
      _$RelatedVideosFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedVideosToJson(this);
}
