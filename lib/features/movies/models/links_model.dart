// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:netflix_clone/features/movies/models/models.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  final SelfModel? self;
  final PreviousEpisodeModel? previousepisode;
  LinksModel(
    this.self,
    this.previousepisode,
  );

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);
  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
