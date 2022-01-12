import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme:
              const AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1))),
      routes: {
        '/auth': (context) => const AuthWidget(),
        // '/main_screen': (context) => const ExampleWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
      },
      initialRoute: '/auth',
      onGenerateRoute: (RouteSettings settings) {
        // используется также в случае если нет маршрута, а также если разные полномочия у пользователей.

        return MaterialPageRoute<void>(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Произошла ошибка навигации'),
            ),
          );
        });
      },
    );
  }
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TMDB'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop;
              }
              ;
            },
            child: Text('Жми'),
          ),
        ));
  }
}
