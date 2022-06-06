import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.moviePlaceholder,
        title: 'Зверополис',
        time: '1 декабря 2021',
        description:
            'Тяжело быть продюсером, когда ты коала и у тебя лапки. Еще сложнее, когда твоя верная помощница древнее печатной машинки. И совсем весело, когда твоя труппа — это танцующий без остановки пухляш, колючая девочка-панк, застенчивая школьница, верзила-гангстер и многодетная мама, чьи дети — поросята в прямом смысле слова. Рецепт успеха прост — рвануть в мировую столицу развлечений, завербовать легендарного рок-музыканта и взорвать сцену новым шоу.'),
    Movie(
        id: 2,
        imageName: AppImages.moviePlaceholder,
        title: 'Вечные',
        time: '3 ноября 2021',
        description:
            'Вечные — представители расы генетически улучшенных суперлюдей, тайно живущих на Земле. Они появились на свет 5 миллионов лет назад в результате экспериментов могущественных целестиалов. Наделённые невероятными суперспособностями, на протяжении тысячелетий они скрывались от человеческой цивилизации, втайне защищая людей от монструозных девиантов. Однако, последние события и действия Таноса заставили их выйти на свет.'),
    Movie(
        id: 3,
        imageName: AppImages.moviePlaceholder,
        title: 'Человек-Паук: Нет пути домой',
        time: '15 декабря 2021',
        description:
            'Действие фильма «Человек-паук: Нет пути домой» начинает своё развитие в тот момент, когда Мистерио удаётся выяснить истинную личность Человека-паука. С этого момента жизнь Питера Паркера становится невыносимой. Если ранее он мог успешно переключаться между своими амплуа, то сейчас это сделать невозможно. Переворачивается с ног на голову не только жизнь Человека-пауку, но и репутация. Понимая, что так жить невозможно, главный герой фильма «Человек-паук: Нет пути домой» принимает решение обратиться за помощью к своему давнему знакомому Стивену Стрэнджу. Питер Паркер надеется, что с помощью магии он сможет восстановить его анонимность. Стрэндж соглашается помочь.'),
    Movie(
        id: 4,
        imageName: AppImages.moviePlaceholder,
        title: 'Охотники за привидениями: Наследники',
        time: '11 ноября 2021',
        description:
            'Мать-одиночка с двумя детьми-подростками селится на старой ферме в Оклахоме, полученной в наследство от отца, которого она не знала. Дети пытаются больше узнать о своем деде и находят автомобиль Ecto-1, принадлежавший знаменитым охотникам за привидениями.'),
    Movie(
        id: 5,
        imageName: AppImages.moviePlaceholder,
        title: 'Энканто',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
    Movie(
        id: 6,
        imageName: AppImages.moviePlaceholder,
        title: 'Тихие зори',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
    Movie(
        id: 7,
        imageName: AppImages.moviePlaceholder,
        title: 'Дюна',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
    Movie(
        id: 8,
        imageName: AppImages.moviePlaceholder,
        title: 'Терминатор',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
    Movie(
        id: 9,
        imageName: AppImages.moviePlaceholder,
        title: 'Лука',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
    Movie(
        id: 10,
        imageName: AppImages.moviePlaceholder,
        title: 'Матрица: Воскрешение',
        time: '24 ноября 2021',
        description:
            'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель решает, что именно она может быть последней надеждой на спасение своей особенной семьи.'),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: const TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
