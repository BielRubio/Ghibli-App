import 'package:flutter/material.dart';
import 'package:ghibli_app/model/location.api.dart';

import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/widgets/location_card_widget.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late List<Location> _locations;
  Map<String, List<Location>> _locationsByMovie = {};

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  Future<void> getLocations() async {
    _locations = await LocationApi.getLocations();

    // Agrupar las ubicaciones por películas
    _locationsByMovie = {};
    for (var location in _locations) {
      if (!_locationsByMovie.containsKey(location.film_name)) {
        _locationsByMovie[location.film_name] = [];
      }
      _locationsByMovie[location.film_name]!.add(location);
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              itemCount: _locationsByMovie.length,
              itemBuilder: (context, index) {
                var movieName = _locationsByMovie.keys.toList()[index];
                var movieLocations = _locationsByMovie[movieName]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$movieName',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ghibli',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movieLocations.length,
                      itemBuilder: (context, index) {
                        return LocationCard(
                          location: movieLocations[index],
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
