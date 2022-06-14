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
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text('From the author of Rainbow Six.',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17))),
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
          'Коллеги и жена Джона Келли убиты. Чудом оставшийся в живых мужчина решает найти преступников и отомстить.',
          style: TextStyle(color: Colors.white, fontSize: 16)),
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
    var _voteAverage = NotifierProvider.watch<MovieDetailsModel>(context)
            ?.movieDetails
            ?.voteAverage ??
        0;
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
                    fillColor: const Color.fromARGB(255, 10, 23, 25),
                    freeColor: const Color.fromARGB(255, 37, 203, 103),
                    lineColor: const Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text(_voteAverage.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 10),
              const Text('User Score'),
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
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
        child: Text(
          'R, 29/04/2021 (US), 1h 49m, боевик, триллер',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
