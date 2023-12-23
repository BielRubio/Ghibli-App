import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future<List<Character>> getCharacters() async {
    var uri = Uri.https('ghibliapi.vercel.app', 'people');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        // Aquí estás devolviendo una List<dynamic>, necesitas mapearla a List<Movie>
        List<Character> character =
            jsonData.map((data) => Character.fromJson(data)).toList();
        return character;
      } else {
        throw Exception('Failed to fetch characters: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
}
