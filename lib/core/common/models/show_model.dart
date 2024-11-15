import 'package:json_annotation/json_annotation.dart';

import 'movie_show_model.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  final int? score;
  final MovieShowModel? show;
  ShowModel(
    this.score,
    this.show,
  );
  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
