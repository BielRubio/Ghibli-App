import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/movie.api.dart';
import 'package:ghibli_app/model/location.api.dart';
import 'package:ghibli_app/widgets/location_card_widget.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late List<Location> _locations;
  late List<Movie> _movies;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLoaction();
  }

  Future<void> getLoaction() async {
    _locations = await LoactionApi.getLocations();
    _movies = await MovieApi.getMovies();

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
            Image.asset(
              "assets/images/logo_ghibli.png",
              scale: 10,
            ),
            const SizedBox(width: 10),
            const Text(
              'LOCATIONS',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                return LocationCard(
                  location: _locations[index],
                  movie: _movies[index],
                );
              },
            ),
    );
  }
}
