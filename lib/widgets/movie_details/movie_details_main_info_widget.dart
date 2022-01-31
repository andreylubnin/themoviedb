import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TopPosterWidget(),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: _MovieNameWidget(),
        ),
        const SummaryWidget(),
        const Text('From the author of Rainbow Six.'),
        const Text('Overview'),
        const Text(
            'Коллеги и жена Джона Келли убиты. Чудом оставшийся в живых мужчина решает найти преступников и отомстить.'),
        Row(
          children: [
            Column(
              children: const [Text('Stefano Sollima'), Text('Director')],
            ),
            Column(
              children: const [Text('Tom Clancy'), Text('Novel')],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: const [Text('Taylor Sheridan'), Text('Screenplay')],
            ),
            Column(
              children: const [Text('Will Staples'), Text('Screenplay')],
            ),
          ],
        ),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
      text: TextSpan(children: [
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

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
        child: const Text(
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
