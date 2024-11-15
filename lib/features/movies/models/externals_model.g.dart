// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'externals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalsModel _$ExternalsModelFromJson(Map<String, dynamic> json) =>
    ExternalsModel(
      (json['tvrage'] as num?)?.toInt(),
      (json['thetvdb'] as num?)?.toInt(),
      json['imbd'] as String?,
    );

Map<String, dynamic> _$ExternalsModelToJson(ExternalsModel instance) =>
    <String, dynamic>{
      'tvrage': instance.tvrage,
      'thetvdb': instance.thetvdb,
      'imbd': instance.imbd,
    };
