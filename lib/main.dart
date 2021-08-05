import 'package:flutter/material.dart';

import 'model/Movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movie Catalog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    generateMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(widget.title),
    );
  }
}

Future<List<Movie>> generateMovieList() {
  List<Movie> _movieList = List<Movie>();
  _movieList.add(Movie(
      "Raya and the Last Dragon",
      "",
      2021,
      7.4,
      "PG",
      "1h 57m",
      "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.",
      "Fantasy",
      "1VIZ89FEjYI"));
  _movieList.add(Movie(
      "Zack Snyder's Justice League",
      "",
      2021,
      8.1,
      "R",
      "4h 2m",
      "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
      "Action",
      "vM-Bja2Gy04"));
  _movieList.add(Movie(
      "Monster Hunter",
      "R.drawable.poster3",
      2020,
      5.3,
      "PG-13",
      "1h 44m",
      "A portal transports Cpt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be their only hope to find a way home.",
      "Fantasy",
      "3od-kQMTZ9M"));
  _movieList.add(Movie(
      "Below Zero",
      "",
      2021,
      6.2,
      "R",
      "1h 46m",
      "When a prisoner transfer van is attacked, the cop in charge must fight those inside and outside while dealing with a silent foe: the icy temperatures.",
      "Action",
      "hSMokfUerVY"));
  _movieList.add(Movie(
      "Tom & Jerry",
      "",
      2021,
      5.3,
      "PG",
      "1h 41m",
      "Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse.",
      "Family",
      "kP9TfCWaQT4"));
}
