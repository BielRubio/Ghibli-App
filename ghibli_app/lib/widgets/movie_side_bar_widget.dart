// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ghibli_app/screens/movie_locations_screen.dart';
import 'package:ghibli_app/screens/movie_characters_screen.dart';
import 'package:ghibli_app/screens/movie_species_screen.dart';

// ignore: camel_case_types
class widget_movie_side_bar extends StatelessWidget {
  final String movieTitle;
  final List<dynamic> speciesURL;
  const widget_movie_side_bar(
      {super.key, required this.movieTitle, required this.speciesURL});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Builder(
        builder: (BuildContext innerContext) {
          return ListView(
            padding: const EdgeInsets.only(top: 20),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Characters'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieCharactersScreen(
                                Title: movieTitle,
                              )));
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Locations'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieLocationsScreen(
                                Title: movieTitle,
                              )));
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: const Text('Species'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieSpeciesScreen(
                                Title: movieTitle,
                                movieSpeciesURL: speciesURL,
                              )));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
