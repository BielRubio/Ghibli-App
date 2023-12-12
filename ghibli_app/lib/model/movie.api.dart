import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future<List<Movie>> getMovies() async {
    var uri = Uri.https(
      'ghibliapi.vercel.app',
      'films',
    );

    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      // Add any additional headers if needed
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return Movie.moviesFromSnapshot(data);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
