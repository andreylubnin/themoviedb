import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 300,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 20,
                itemExtent: 120,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.hardEdge,
                        child: Column(children: [
                          const Image(image: AssetImage(AppImages.actor)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Michael B.Jordan', maxLines: 1),
                                SizedBox(height: 7),
                                Text('John Kelly', maxLines: 4),
                                SizedBox(height: 7),
                                Text('8 episodes', maxLines: 1),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  );
                },
              ),
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
