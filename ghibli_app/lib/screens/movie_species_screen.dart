import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/species.api.dart';
import 'package:ghibli_app/widgets/species_card_widget.dart';

class MovieSpeciesScreen extends StatefulWidget {
  final String Title;
  const MovieSpeciesScreen({super.key, required this.Title});

  @override
  _MovieSpeciesScreen createState() => _MovieSpeciesScreen();
}

class _MovieSpeciesScreen extends State<MovieSpeciesScreen> {
  late List<Specie> _species;
  late List<Specie> moviespecies;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getSpecies();
  }

  Future<void> getSpecies() async {
    _species = await SpeciesApi.getSpecies();
    moviespecies = GetMovieSpecies(_species, widget.Title);
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
                textScaleFactor: 1.8,
                style: const TextStyle(fontFamily: 'Ghibli'),
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

List<Specie> GetMovieSpecies(List<Specie> charToSearch, String FilmName) {
  return charToSearch
      .where((specie_) => specie_.film_Name == FilmName)
      .toList();
}
