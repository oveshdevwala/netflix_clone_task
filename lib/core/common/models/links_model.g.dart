// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      json['self'] == null
          ? null
          : SelfModel.fromJson(json['self'] as Map<String, dynamic>),
      json['previousepisode'] == null
          ? null
          : PreviousEpisodeModel.fromJson(
              json['previousepisode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'self': instance.self,
      'previousepisode': instance.previousepisode,
    };
