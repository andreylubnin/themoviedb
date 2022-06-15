import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/library/widgets/inherited/provider.dart';
import 'package:themoviedb/ui/widgets/elements/radial_percent_widget.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        SummaryWidget(),
        _MovieTaglineWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: _OverviewWidget(),
        ),
        _DescriptionWidget(),
        SizedBox(height: 30),
        _PeopleWidgets(),
      ],
    );
  }
}

class _MovieTaglineWidget extends StatelessWidget {
  const _MovieTaglineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
        _model?.movieDetails?.tagline ?? '',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: 17,
        ),
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17);
    const jobTitleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Stefano Sollima', style: nameStyle),
                  Text('Director', style: jobTitleStyle)
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Tom Clancy', style: nameStyle),
                  Text('Novel', style: jobTitleStyle)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Taylor Sheridan', style: nameStyle),
                  Text('Screenplay', style: jobTitleStyle)
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Will Staples', style: nameStyle),
                  Text('Screenplay', style: jobTitleStyle)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(_model?.movieDetails?.overview ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Обзор',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17));
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);
    final backdropPath = _model?.movieDetails?.backdropPath;
    final posterPath = _model?.movieDetails?.posterPath;

    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ApiClient.imageUrl(backdropPath))
              : const SizedBox.shrink(),
          Positioned(
              top: 20,
              left: 20,
              bottom: 20,
              child: posterPath != null
                  ? Image.network(ApiClient.imageUrl(posterPath))
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);
    var _year = _model?.movieDetails?.releaseDate?.year.toString();
    _year = _year != null ? ' ($_year)' : '';
    return Center(
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: _model?.movieDetails?.title ?? '',
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
          TextSpan(
              text: _year,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
        ]),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    var _voteAverage = movieDetails?.voteAverage ?? 0;
    _voteAverage = _voteAverage * 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: RadialPercentWidget(
                    percent: _voteAverage / 100,
                    bgColor: const Color.fromARGB(255, 10, 23, 25),
                    lineColor: const Color.fromARGB(255, 37, 203, 103),
                    freeColor: const Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text(_voteAverage.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 10),
              const Text('Рейтинг'),
            ],
          ),
        ),
        Container(width: 1.0, height: 15, color: Colors.grey),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(Icons.play_arrow),
              Text('Play Trailer'),
            ],
          ),
        ),
      ],
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();

    final movieDetails = model.movieDetails;
    final _releaseWhere = model.movieReleaseDates?.results
        .firstWhere((element) => element.iso == 'RU' || element.iso == 'US');
    final country = _releaseWhere?.iso;
    final _releaseInfo =
        _releaseWhere?.releaseDates.firstWhere((element) => element.type == 3);
    final certification = _releaseInfo?.certification;
    final releaseDate = model.stringFromDate(_releaseInfo?.releaseDate);
    final runtime = movieDetails?.runtime ?? 0;
    final hours = Duration(minutes: runtime).inHours;
    final minutes = Duration(minutes: runtime).inMinutes.remainder(60);
    final duration = '$hours ч $minutes мин';
    final genres = movieDetails?.genres;
    String genreString = '';
    if (genres != null && genres.isNotEmpty) {
      var genreList = <String>[];
      for (var genre in genres) {
        genreList.add(genre.name);
      }
      genreString = genreList.join(', ');
    }
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
        child: Text(
          '$certification, $releaseDate ($country), $duration, $genreString',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
