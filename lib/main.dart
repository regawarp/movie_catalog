import 'package:flutter/material.dart';
import 'package:movie_catalog/detail.dart';

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
  Future<List<Movie>> _movieList;

  @override
  void initState() {
    super.initState();
    _movieList = generateMovieList();
  }

  Future<List<Movie>> generateMovieList() async {
    List<Movie> _movieList = List<Movie>();
    _movieList.add(Movie(
        "Raya and the Last Dragon",
        "https://cdn.popmama.com/content-images/post/20210128/raya-and-the-last-dragon-3-5fe68c989c6be4bbb26222c710104f23_600xauto.jpg",
        2021,
        7.4,
        "PG",
        "1h 57m",
        "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.",
        "Fantasy",
        "1VIZ89FEjYI"));
    _movieList.add(Movie(
        "Zack Snyder's Justice League",
        "https://pict.sindonews.net/dyn/600/pena/sindo-article/original/2021/03/03/Zack%20Snyder%20Justice%20League%20-%20Heroes%20Key%20Art%20Vertical.jpg",
        2021,
        8.1,
        "R",
        "4h 2m",
        "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
        "Action",
        "vM-Bja2Gy04"));
    _movieList.add(Movie(
        "Monster Hunter",
        "https://i.pinimg.com/564x/3a/4f/c1/3a4fc10dff3393dfdb11ae505d915f93.jpg",
        2020,
        5.3,
        "PG-13",
        "1h 44m",
        "A portal transports Cpt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be their only hope to find a way home.",
        "Fantasy",
        "3od-kQMTZ9M"));
    _movieList.add(Movie(
        "Below Zero",
        "https://m.media-amazon.com/images/M/MV5BMjg0NTBjOWEtMDc1OS00ZDEyLWE3ZTItMGQzYTIyZDJkM2U2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
        2021,
        6.2,
        "R",
        "1h 46m",
        "When a prisoner transfer van is attacked, the cop in charge must fight those inside and outside while dealing with a silent foe: the icy temperatures.",
        "Action",
        "hSMokfUerVY"));
    _movieList.add(Movie(
        "Tom & Jerry",
        "https://cdn.cinematerial.com/p/297x/osu2gdkh/tom-and-jerry-movie-poster-md.jpg?v=1614079055",
        2021,
        5.3,
        "PG",
        "1h 41m",
        "Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse.",
        "Family",
        "kP9TfCWaQT4"));
    return _movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _movieList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error while retrieving data');
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detail(snapshot.data[index])));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "Image ${snapshot.data[index].title}",
                          child: Image.network(
                            "${snapshot.data[index].image}",
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data[index].title}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('${snapshot.data[index].year}'),
                                    SizedBox(width: 10),
                                    Text('${snapshot.data[index].duration}'),
                                    SizedBox(width: 10),
                                    Text('${snapshot.data[index].mpaRating}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Text('${snapshot.data[index].rating}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
