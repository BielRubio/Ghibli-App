import 'dart:ffi';

import 'package:ghibli_app/model/character.api.dart';
import 'package:ghibli_app/model/location.api.dart';
import 'package:ghibli_app/model/movie.api.dart';

class Character {
  final String id,
      name,
      gender,
      age,
      eye_color,
      hair_color,
      specieID,
      filmID,
      specieName,
      filmName;
  Character(
      {required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.eye_color,
      required this.hair_color,
      required this.specieID,
      required this.filmID,
      required this.specieName,
      required this.filmName});

  static Future<Character> fromJson(dynamic json) async {
    List<dynamic> films = json['films'];
    String firstFilmUrl = films.isNotEmpty ? films[0] : "";
    String speciename = await CharacterApi.fetchSpeciesName(json['species']);
    String filmname = await CharacterApi.fetchMovieName(firstFilmUrl);

    return Character(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
      eye_color: json['eye_color'] as String,
      hair_color: json['hair_color'] as String,
      specieID: json['species'] as String,
      filmID: firstFilmUrl,
      specieName: speciename,
      filmName: filmname,
    );
  }

  static Future<List<Character>> moviesFromSnapshot(List snapshot) async {
    List<Future<Character>> futures = snapshot.map((data) {
      return Character.fromJson(data);
    }).toList();

    // Esperar a que todos los futuros se completen
    List<Character> characters = await Future.wait(futures);

    return characters;
  }

  @override
  String toString() {
    return 'Character {id: $id,  name: $name,  gender: $gender,  age: $age, eye_color: $eye_color, hair_color: $hair_color, species: $specieID }';
  }
}

class Specie {
  final String id, name, classification, eye_colors, hair_colors, firstMovie;
  Specie(
      {required this.id,
      required this.name,
      required this.classification,
      required this.eye_colors,
      required this.hair_colors,
      required this.firstMovie});

  static Future<Specie> fromJson(dynamic json) async {
    List<dynamic> films = json['films'];
    String firstFilmUrl = films.isNotEmpty ? films[0] : "";
    String filmname = await CharacterApi.fetchMovieName(firstFilmUrl);

    return Specie(
      id: json['id'] as String,
      name: json['name'] as String,
      classification: json['classification'] as String,
      eye_colors: json['eye_colors'] as String,
      hair_colors: json['hair_colors'] as String,
      firstMovie: firstFilmUrl,
    );
  }

  static Future<List<Specie>> moviesFromSnapshot(List snapshot) async {
    List<Future<Specie>> futures = snapshot.map((data) {
      return Specie.fromJson(data);
    }).toList();

    // Esperar a que todos los futuros se completen
    List<Specie> species = await Future.wait(futures);

    return species;
  }

  @override
  String toString() {
    return 'Specie {id: $id,  name: $name,  classification: $classification,  eye_colors: $eye_colors, hair_colors: $hair_colors}';
  }
}

class Location {
  final String id, name, climate, terrain, firstMovie, film_name;
  Location({
    required this.id,
    required this.name,
    required this.climate,
    required this.terrain,
    required this.firstMovie,
    required this.film_name,
  });

  static Future<Location> fromJson(dynamic json) async {
    List<dynamic> films = json['films'];
    String firstFilmUrl = films.isNotEmpty ? films[0] : "";
    String filmname = await LocationApi.fetchMovieName_Locations(firstFilmUrl);

    return Location(
      id: json['id'] as String,
      name: json['name'] as String,
      climate: json['climate'] as String,
      terrain: json['terrain'] as String,
      firstMovie: firstFilmUrl,
      film_name: filmname,
    );
  }

  static Future<List<Location>> moviesFromSnapshot(List snapshot) async {
    List<Future<Location>> futures = snapshot.map((data) {
      return Location.fromJson(data);
    }).toList();

    // Esperar a que todos los futuros se completen
    List<Location> locations = await Future.wait(futures);

    return locations;
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
