import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class SpeciesApi {
  static Future<List<Character>> getSpecies() async {
    var uri = Uri.https('ghibliapi.vercel.app', 'species');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        // Usar Future.wait para esperar la resolución de todos los futuros
        List<Character> species = await Future.wait(
          jsonData.map((data) => Character.fromJson(data)),
        );

        return species;
      } else {
        throw Exception('Failed to fetch species: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch species: $e');
    }
  }
}
