// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/widgets/species_card_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieSpeciesScreen extends StatefulWidget {
  final String Title;
  final List<dynamic> movieSpeciesURL;

  const MovieSpeciesScreen(
      {super.key, required this.Title, required this.movieSpeciesURL});

  @override
  // ignore: library_private_types_in_public_api
  _MovieSpeciesScreen createState() => _MovieSpeciesScreen();
}

class _MovieSpeciesScreen extends State<MovieSpeciesScreen> {
  late List<Specie> moviespecies = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getSpecies();
  }

  Future<void> getSpecies() async {
    try {
      await Future.forEach(widget.movieSpeciesURL, (url) async {
        Specie? specie = await getSpecieFromUrl(url);
        if (specie != null) {
          moviespecies.add(specie);
        }
      });

      setState(() {
        _isLoading = false;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 189, 125),
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                '${widget.Title}',
                // ignore: deprecated_member_use
                textScaleFactor: 1.8,
                style: const TextStyle(fontFamily: 'Ghibli', fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : moviespecies.isEmpty
              ? const Center(
                  child: Text(
                    "This api does not provide any species for this movie",
                    style: TextStyle(
                        color: Color.fromARGB(255, 170, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: moviespecies.length,
                  itemBuilder: (context, index) {
                    return SpeciesCard(
                      species: moviespecies[index],
                    );
                  },
                ),
    );
  }
}

Future<Specie?> getSpecieFromUrl(String specieUrl) async {
  try {
    final response = await http.get(Uri.parse(specieUrl));

    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      if (jsonData is Map<String, dynamic> &&
          jsonData.containsKey('name') &&
          jsonData['name'] != null) {
        return Specie.fromJson(jsonData);
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to fetch specie: ${response.statusCode}');
    }
  } on Exception catch (e) {
    throw Exception('Failed to fetch specie: $e');
  }
}
