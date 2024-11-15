// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      (json['score'] as num?)?.toInt(),
      json['show'] == null
          ? null
          : MovieShowModel.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'score': instance.score,
      'show': instance.show,
    };
