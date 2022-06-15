import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/library/widgets/inherited/provider.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (_model == null) return const SizedBox.shrink();
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Series Cast',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 280,
            child: Scrollbar(
              child: _CastListWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
              onPressed: () {},
              child: const Text('Full Cast & Crew'),
            ),
          )
        ],
      ),
    );
  }
}

class _CastListWidget extends StatelessWidget {
  const _CastListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (_model == null) return const SizedBox.shrink();
    var _cast = _model.movieDetails!.credits.cast;
    if (_cast.isEmpty) return const SizedBox.shrink();
    _cast = _cast.length > 10 ? _cast.sublist(0, 11) : _cast;

    return ListView.builder(
      itemCount: _cast.length,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final actorImage = _cast[index].profilePath;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              clipBehavior: Clip.hardEdge,
              child: Column(children: [
                //const Image(image: AssetImage(AppImages.actor)),
                actorImage != null
                    ? Image.network(ApiClient.imageUrl(actorImage))
                    : const SizedBox.shrink(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_cast[index].character, maxLines: 1),
                        const SizedBox(height: 7),
                        Text(
                          _cast[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
