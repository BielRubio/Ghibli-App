// ignore_for_file: avoid_print

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

        List<Specie> species = await Future.wait(
          jsonData.map((data) => Specie.fromJson(data)),
        );
        return species;
      } else {
        throw Exception('Failed to fetch species: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch species: $e');
    }
  }

  static Future<String> fetchMovieName(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String name = data['title'];
        return name;
      } else {
        throw Exception('Failed to load movie name');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to fetch movie name');
    }
  }
}
