// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:netflix_clone/features/movies/models/models.dart';

part 'movie_show_model.g.dart';

@JsonSerializable()
class MovieShowModel {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final ScheduleModel? schedule;
  final RatingModel? rating;
  final int? weight;
  final NetworkModel? network;
  // final dy? webChannel;
  final String? dvdCountry;
  final ExternalsModel? externals;
  final ImageModel? image;
  final String? summary;
  final int? updated;
  @JsonKey(name: '_links')
  final LinksModel? links;

  MovieShowModel(
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    // this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  );

  factory MovieShowModel.fromJson(Map<String, dynamic> json) =>
      _$MovieShowModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieShowModelToJson(this);
}
