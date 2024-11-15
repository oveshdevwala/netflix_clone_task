// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'previous_episode_model.g.dart';

@JsonSerializable()
class PreviousEpisodeModel {
  final String? href;
  final String? name;
  PreviousEpisodeModel(
    this.href,
    this.name,
  );

  factory PreviousEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousEpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PreviousEpisodeModelToJson(this);
}
