import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_catalog/model/Movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Detail extends StatefulWidget {
  final Movie movie;

  Detail(this.movie);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {


  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.movie.trailer,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.movie.title}'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.movie.title}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text('${widget.movie.year}'),
                  SizedBox(width: 8,),
                  Text('${widget.movie.mpaRating}'),
                  SizedBox(width: 8,),
                  Text('${widget.movie.duration}'),
                ],
              ),
              Divider(),
              YoutubePlayer(
                controller: _controller,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "Image ${widget.movie.title}",
                      child: Image.network(
                        '${widget.movie.image}',
                        width: 100,
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('${widget.movie.synopsis}'),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 50,
                    ),
                    Text('${widget.movie.rating}/10',
                    textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
