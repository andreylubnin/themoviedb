import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/domain/entity/movie_release_dates.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _apiClient = ApiClient();

  final int movieId;
  MovieDetails? _movieDetails;
  MovieReleaseDates? _movieReleaseDates;
  bool _isFavorite = false;
  String _locale = '';
  late DateFormat _dateFormat;

  MovieDetails? get movieDetails => _movieDetails;
  MovieReleaseDates? get movieReleaseDates => _movieReleaseDates;
  bool get isFavorite => _isFavorite;

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
    final sessionId = await _sessionDataProvider.getSessionId();
    if (sessionId != null) {
      _isFavorite = await _apiClient.isFavorite(movieId, sessionId);
    }
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavorite = !_isFavorite;
    notifyListeners();

    try {
      await _apiClient.markAsFavorite(
        accountId: accountId,
        sessionId: sessionId,
        mediaType: MediaType.Movie,
        mediaId: movieId,
        isFavorite: _isFavorite,
      );
    } catch (e) {
      print(e);
    }
  }
}
