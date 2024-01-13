// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/character.api.dart';
import 'package:ghibli_app/widgets/character_card_widget.dart';

class MovieCharactersScreen extends StatefulWidget {
  final String Title;
  const MovieCharactersScreen({super.key, required this.Title});

  @override
  // ignore: library_private_types_in_public_api
  _MovieCharactersScreenState createState() => _MovieCharactersScreenState();
}

class _MovieCharactersScreenState extends State<MovieCharactersScreen> {
  late List<Character> _characters;
  late List<Character> moviecharacters;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  Future<void> getCharacters() async {
    _characters = await CharacterApi.getCharacters();
    moviecharacters = GetMovieCharacters(_characters, widget.Title);
    setState(() {
      _isLoading = false;
    });
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
                style: const TextStyle(fontFamily: 'Ghibli'),
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : moviecharacters.isEmpty
              ? const Center(
                  child: Text(
                    "This api does not provide any characters for this movie",
                    style: TextStyle(
                        color: Color.fromARGB(255, 170, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: moviecharacters.length,
                  itemBuilder: (context, index) {
                    return CharacterCard(
                      character: moviecharacters[index],
                    );
                  },
                ),
    );
  }
}

List<Character> GetMovieCharacters(
    List<Character> charToSearch, String FilmName) {
  return charToSearch
      .where((character) => character.filmName == FilmName)
      .toList();
}
