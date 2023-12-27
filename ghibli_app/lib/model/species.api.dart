import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class SpeciesApi {
  static Future<List<Specie>> getSpecies() async {
    var uri = Uri.https('ghibliapi.vercel.app', 'species');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        List<Specie> species =
            jsonData.map((data) => Specie.fromJson(data)).toList();
        return species;
      } else {
        throw Exception('Failed to fetch species: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch species: $e');
    }
  }
}
