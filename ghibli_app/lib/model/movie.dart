class Character {
  final String id, name, gender, age, eye_color, hair_color, specieID, filmID;
  Character(
      {required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.eye_color,
      required this.hair_color,
      required this.specieID,
      required this.filmID});

  factory Character.fromJson(dynamic json) {
    
    List<dynamic> films = json['films'];
    String firstFilmUrl = films.isNotEmpty ? films[0] : "";

    return Character(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
      eye_color: json['eye_color'] as String,
      hair_color: json['hair_color'] as String,
      specieID: json['species'] as String,
      filmID: firstFilmUrl,
    );
  }

  static List<Location> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Location.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Character {id: $id,  name: $name,  gender: $gender,  age: $age, eye_color: $eye_color, hair_color: $hair_color, species: $specieID }';
  }
}

class Specie {
  final String id, name, classification, eye_colors, hair_colors;
  final Movie firstMovie;
  const Specie(this.id, this.name, this.classification, this.eye_colors,
      this.hair_colors, this.firstMovie);
}

class Location {
  final String id, name, climate, terrain;
  Location(
      {required this.id,
      required this.name,
      required this.climate,
      required this.terrain});

  factory Location.fromJson(dynamic json) {
    return Location(
      id: json['id'] as String,
      name: json['name'] as String,
      climate: json['climate'] as String,
      terrain: json['terrain'] as String,

      //people: List<Character>.from(json['people'].map((x) => Character.fromJson(x))),
      //species: List<Specie>.from(json['species'].map((x) => Specie.fromJson(x))),
      //locations: List<Location>.from(json['locations'].map((x) => Location.fromJson(x))),
    );
  }

  static List<Location> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Location.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Location {id: $id,  name: $name,  climate: $climate,  terrain: $terrain}';
  }
}

class Movie {
  final String id,
      title,
      image,
      description,
      director,
      producer,
      release_date,
      running_time,
      rt_score;

  final List<Character> people;
  final List<Specie> species;
  final List<Location> locations;
  bool liked;
  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.running_time,
    required this.rt_score,
    this.people = const [],
    this.species = const [],
    this.locations = const [],
    this.liked = false,
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      release_date: json['release_date'] as String,
      running_time: json['running_time'] as String,
      rt_score: json['rt_score'] as String,
      //people: List<Character>.from(json['people'].map((x) => Character.fromJson(x))),
      //species: List<Specie>.from(json['species'].map((x) => Specie.fromJson(x))),
      //locations: List<Location>.from(json['locations'].map((x) => Location.fromJson(x))),
    );
  }

  static List<Movie> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movie {id: $id,  title: $title,  imageUrl: $image,  director: $director, producer: $producer,release_date: $release_date,  running_time: $running_time}';
  }
}
