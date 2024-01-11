import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/character.api.dart';
import 'package:ghibli_app/widgets/character_card_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> _characters;
  Map<String, List<Character>> _charactersByMovie = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  Future<void> getCharacters() async {
    _characters = await CharacterApi.getCharacters();
    _charactersByMovie = {};
    for (var character in _characters) {
      if (!_charactersByMovie.containsKey(character.filmName)) {
        _charactersByMovie[character.filmName] = [];
      }
      _charactersByMovie[character.filmName]!.add(character);
    }
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Flexible(child:Text(
              'ALL CHARACTERS',
              textScaleFactor: 1.8,
              style: TextStyle(fontFamily: 'Ghibli'),
            ), ),
            
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _charactersByMovie.length,
              itemBuilder: (context, index) {
                var movieName = _charactersByMovie.keys.toList()[index];
                var movieCharacters = _charactersByMovie[movieName]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movieName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ghibli',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: movieCharacters.length,
                      itemBuilder: (context, index) {
                        return CharacterCard(
                          character: movieCharacters[index],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
