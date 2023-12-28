import 'dart:convert';
import 'package:ghibli_app/model/movie.dart';
import 'package:http/http.dart' as http;

class LocationApi {
  static Future<List<Location>> getLocations() async {
    var uri = Uri.https('ghibliapi.vercel.app', 'locations');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        List<Location> locations = await Future.wait(
          jsonData.map((data) => Location.fromJson(data)),
        );

        return locations;
      } else {
        throw Exception('Failed to fetch Locations: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch Locations: $e');
    }
  }

  static Future<String> fetchLocationsName(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String name = data['name'];
        return name;
      } else {
        throw Exception('Failed to load Locations name');
      }
    } catch (error) {
      return "Unknown";
    }
  }

  static Future<String> fetchMovieName_Locations(String apiUrl) async {
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
