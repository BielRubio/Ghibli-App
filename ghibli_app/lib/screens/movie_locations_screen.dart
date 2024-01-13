import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/location.api.dart';
import 'package:ghibli_app/widgets/location_card_widget.dart';

class MovieLocationsScreen extends StatefulWidget {
  final String Title;
  const MovieLocationsScreen({super.key, required this.Title});

  @override
  _MovieLocationsScreenState createState() => _MovieLocationsScreenState();
}

class _MovieLocationsScreenState extends State<MovieLocationsScreen> {
  late List<Location> _locations;
  late List<Location> movielocations;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  Future<void> getLocations() async {
    _locations = await LocationApi.getLocations();
    movielocations = GetMovieLocations(_locations, widget.Title);
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
          : movielocations.isEmpty
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
                  itemCount: movielocations.length,
                  itemBuilder: (context, index) {
                    return LocationCard(
                      location: movielocations[index],
                    );
                  },
                ),
    );
  }
}

List<Location> GetMovieLocations(List<Location> charToSearch, String FilmName) {
  return charToSearch
      .where((location) => location.film_name == FilmName)
      .toList();
}
