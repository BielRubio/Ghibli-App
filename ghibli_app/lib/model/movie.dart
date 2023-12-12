class Character {
  final String id, name, gender, age, eye_color, hair_color;
  final Specie specie;
  const Character(this.id, this.name, this.gender, this.age, this.eye_color,
      this.hair_color, this.specie);
}

class Specie {
  final String id, name, classification, eye_colors, hair_colors;
  final Movie firstMovie;
  const Specie(this.id, this.name, this.classification, this.eye_colors,
      this.hair_colors, this.firstMovie);
}

class Location {
  final String id, name, climate, terrain;
  const Location(this.id, this.name, this.climate, this.terrain);
}

class Movie {
  final String id,
      title,
      imageUrl,
      description,
      director,
      producer,
      release_date,
      running_time;

  final double rt_score;
  final List<Character> people;
  final List<Specie> species;
  final List<Location> locations;

  const Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.running_time,
    required this.rt_score,
    this.people = const [],
    this.species = const [],
    this.locations = const [],
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      release_date: json['release_date'] as String,
      running_time: json['running_time'] as String,
      rt_score: json['rt_score'] as double,
    );
  }

  static List<Movie> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }
}
