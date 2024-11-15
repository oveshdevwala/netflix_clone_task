// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  final String? name;
  final String? code;
  final String? timezone;
  CountryModel(
    this.name,
    this.code,
    this.timezone,
  );

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
