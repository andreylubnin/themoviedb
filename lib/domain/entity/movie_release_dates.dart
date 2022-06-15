import 'package:json_annotation/json_annotation.dart';

part 'movie_release_dates.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieReleaseDates {
  final int id;
  final List<Result> results;
  MovieReleaseDates({
    required this.id,
    required this.results,
  });

  factory MovieReleaseDates.fromJson(Map<String, dynamic> json) =>
      _$MovieReleaseDatesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieReleaseDatesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  @JsonKey(name: 'iso_3166_1')
  final String? iso;
  @JsonKey(name: 'release_dates')
  final List<ReleaseDate> releaseDates;
  Result({
    required this.iso,
    required this.releaseDates,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ReleaseDate {
  final String? certification;
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;
  final int? type;
  ReleaseDate({
    required this.certification,
    required this.iso,
    required this.releaseDate,
    required this.type,
  });

  factory ReleaseDate.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDateToJson(this);
}
