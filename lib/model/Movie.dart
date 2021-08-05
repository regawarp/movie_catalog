class Movie{
  final String title;
  final String image;
  final int year;
  final double rating;
  final String mpaRating;
  final String duration;
  final String synopsis;
  final String genre;
  final String trailer;

  Movie(this.title, this.image, this.year, this.rating, this.mpaRating, this.duration, this.synopsis, this.genre, this.trailer);


  toMap(){
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['image'] = image;
    map['year'] = year;
    map['rating'] = rating;
    map['mpaRating'] = mpaRating;
    map['duration'] = duration;
    map['synopsis'] = synopsis;
    map['genre'] = genre;
    map['trailer'] = trailer;
  }
}