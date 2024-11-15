// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final num? average;
  RatingModel(
    this.average,
  );

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
