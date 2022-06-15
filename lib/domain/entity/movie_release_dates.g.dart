// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_release_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieReleaseDates _$MovieReleaseDatesFromJson(Map<String, dynamic> json) {
  return MovieReleaseDates(
    id: json['id'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieReleaseDatesToJson(MovieReleaseDates instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    iso: json['iso_3166_1'] as String?,
    releaseDates: (json['release_dates'] as List<dynamic>)
        .map((e) => ReleaseDate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'iso_3166_1': instance.iso,
      'release_dates': instance.releaseDates,
    };

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) {
  return ReleaseDate(
    certification: json['certification'] as String?,
    iso: json['iso_639_1'] as String?,
    releaseDate: json['release_date'] == null
        ? null
        : DateTime.parse(json['release_date'] as String),
    type: json['type'] as int?,
  );
}

Map<String, dynamic> _$ReleaseDateToJson(ReleaseDate instance) =>
    <String, dynamic>{
      'certification': instance.certification,
      'iso_639_1': instance.iso,
      'release_date': instance.releaseDate?.toIso8601String(),
      'type': instance.type,
    };
