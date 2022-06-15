import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/domain/entity/movie_release_dates.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final int movieId;
  MovieDetails? _movieDetails;
  MovieReleaseDates? _movieReleaseDates;
  String _locale = '';
  late DateFormat _dateFormat;

  MovieDetails? get movieDetails => _movieDetails;
  MovieReleaseDates? get movieReleaseDates => _movieReleaseDates;

  MovieDetailsModel(this.movieId);

  String stringFromDate(DateTime? date) {
    return date != null ? _dateFormat.format(date) : '';
  }

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadMovieDetails();
  }

  Future<void> loadMovieDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId, _locale);
    _movieReleaseDates = await _apiClient.movieReleaseDates(movieId);
    notifyListeners();
  }
}
