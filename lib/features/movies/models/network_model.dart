// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:netflix_clone/features/movies/models/country_model.dart';

part 'network_model.g.dart';

@JsonSerializable()
class NetworkModel {
  final int? id;
  final String? name;
  final CountryModel? country;
  final String? officialSite;

  NetworkModel(
    this.id,
    this.name,
    this.country,
    this.officialSite,
  );

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkModelToJson(this);
}
