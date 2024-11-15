// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'externals_model.g.dart';

@JsonSerializable()
class ExternalsModel {
  final int? tvrage;
  final int? thetvdb;
  final String? imbd;
  ExternalsModel(
    this.tvrage,
    this.thetvdb,
    this.imbd,
  );

  factory ExternalsModel.fromJson(Map<String, dynamic> json) =>
      _$ExternalsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalsModelToJson(this);
}
