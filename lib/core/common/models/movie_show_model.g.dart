// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieShowModel _$MovieShowModelFromJson(Map<String, dynamic> json) =>
    MovieShowModel(
      (json['id'] as num?)?.toInt(),
      json['url'] as String?,
      json['name'] as String?,
      json['type'] as String?,
      json['language'] as String?,
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['status'] as String?,
      (json['runtime'] as num?)?.toInt(),
      (json['averageRuntime'] as num?)?.toInt(),
      json['premiered'] as String?,
      json['ended'] as String?,
      json['officialSite'] as String?,
      json['schedule'] == null
          ? null
          : ScheduleModel.fromJson(json['schedule'] as Map<String, dynamic>),
      json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      (json['weight'] as num?)?.toInt(),
      json['network'] == null
          ? null
          : NetworkModel.fromJson(json['network'] as Map<String, dynamic>),
      json['dvdCountry'] as String?,
      json['externals'] == null
          ? null
          : ExternalsModel.fromJson(json['externals'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      json['summary'] as String?,
      (json['updated'] as num?)?.toInt(),
      json['_links'] == null
          ? null
          : LinksModel.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieShowModelToJson(MovieShowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'runtime': instance.runtime,
      'averageRuntime': instance.averageRuntime,
      'premiered': instance.premiered,
      'ended': instance.ended,
      'officialSite': instance.officialSite,
      'schedule': instance.schedule,
      'rating': instance.rating,
      'weight': instance.weight,
      'network': instance.network,
      'dvdCountry': instance.dvdCountry,
      'externals': instance.externals,
      'image': instance.image,
      'summary': instance.summary,
      'updated': instance.updated,
      '_links': instance.links,
    };
