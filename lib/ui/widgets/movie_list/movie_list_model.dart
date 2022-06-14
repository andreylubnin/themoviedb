import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/movie.dart';
import 'package:themoviedb/domain/entity/movie_list_response.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];

  // переменные, описывающие текущее состояние модели
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  String? _searchQuery;
  String _locale = '';
  Timer? searchDebounce;

  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;

  String stringFromDate(DateTime? date) {
    return date != null ? _dateFormat.format(date) : '';
  }

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await _resetMovieList();
  }

  Future<void> _resetMovieList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await _loadNextPage();
  }

  Future<MovieListResponse> _loadMovies(int nextPage, String locale) async {
    final query = _searchQuery ?? '';
    if (query == '') {
      return await _apiClient.popularMovie(nextPage, _locale);
    } else {
      return await _apiClient.searchMovie(nextPage, _locale, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponse = await _loadMovies(nextPage, _locale);
      _movies.addAll(moviesResponse.movies);
      _currentPage = moviesResponse.page;
      _totalPage = moviesResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetMovieList();
    });
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadNextPage();
  }
}
