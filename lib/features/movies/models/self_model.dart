// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'self_model.g.dart';

@JsonSerializable()
class SelfModel {
  final String? href;
  SelfModel(
    this.href,
  );

  factory SelfModel.fromJson(Map<String, dynamic> json) =>
      _$SelfModelFromJson(json);
  Map<String, dynamic> toJson() => _$SelfModelToJson(this);
}
