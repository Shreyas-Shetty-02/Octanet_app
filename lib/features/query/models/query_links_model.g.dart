// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryLinks _$QueryLinksFromJson(Map<String, dynamic> json) => QueryLinks(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      relatedVideos: (json['related_videos'] as List<dynamic>?)
          ?.map((e) => RelatedVideos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QueryLinksToJson(QueryLinks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'related_videos': instance.relatedVideos,
    };

RelatedVideos _$RelatedVideosFromJson(Map<String, dynamic> json) =>
    RelatedVideos(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$RelatedVideosToJson(RelatedVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
    };
