import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/elements/radial_percent_widget.dart';

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
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Stefano Sollima', style: nameStyle),
                  Text('Director', style: jobTitleStyle)
                ],
              ),
            ),
            SizedBox(width: 20),
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
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Taylor Sheridan', style: nameStyle),
                  Text('Screenplay', style: jobTitleStyle)
                ],
              ),
            ),
            SizedBox(width: 20),
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
    return Stack(
      children: const [
        Image(
          image: AssetImage(AppImages.topHeader),
        ),
        Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Image(image: AssetImage(AppImages.topHeaderSubImage))),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(children: [
        TextSpan(
            text: 'Tom Clancy`s Without Remorse',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
        TextSpan(
            text: ' (2021)',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              SizedBox(
                width: 45,
                height: 45,
                child: RadialPercentWidget(
                    percent: 0.72,
                    fillColor: Color.fromARGB(255, 10, 23, 25),
                    freeColor: Color.fromARGB(255, 37, 203, 103),
                    lineColor: Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text('72', style: TextStyle(color: Colors.white))),
              ),
              SizedBox(width: 10),
              Text('User Score'),
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
