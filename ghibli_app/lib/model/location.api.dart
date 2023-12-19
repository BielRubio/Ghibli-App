import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class LoactionApi {
  static Future<List<Location>> getLocations() async {
    var uri = Uri.https('ghibliapi.vercel.app', 'locations');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        // Aquí estás devolviendo una List<dynamic>, necesitas mapearla a List<Movie>
        List<Location> locations =
            jsonData.map((data) => Location.fromJson(data)).toList();
        return locations;
      } else {
        throw Exception('Failed to fetch movies: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
