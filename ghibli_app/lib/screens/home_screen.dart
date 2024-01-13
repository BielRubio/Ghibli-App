// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.api.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/screens/movie_screen.dart';
import 'package:ghibli_app/widgets/movie_card_widget.dart';
import 'package:ghibli_app/widgets/search_bar.dart';
import 'package:ghibli_app/widgets/side_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> _movies = const [];
  List<Movie> _filteredMovies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMovie();
  }

  Future<void> getMovie() async {
    _movies = await MovieApi.getMovies();
    setState(() {
      _filteredMovies = _movies;
      _isLoading = false;
    });
  }

  void _onSearch(String query) {
    setState(() {
      _filteredMovies = query.isEmpty
          ? _movies
          : _movies
              .where((movie) =>
                  movie.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

      print("Filtered Movies: ");
      _filteredMovies.forEach((movie) => print(movie.title));
    });
  }

  List<Movie> getLikedMovies() {
    return getLikedList(_movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 189, 125),
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Image.asset(
              "assets/images/logo_ghibli.png",
              scale: 10,
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GHIBLI REALM',
                    // ignore: deprecated_member_use
                    textScaleFactor: 2,
                    style: TextStyle(fontFamily: 'Ghibli'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              SearchBarWidget(onSearch: _onSearch),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = (constraints.maxWidth / 200)
                        .floor(); // Tamaño deseado de las tarjetas es 200
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio:
                            0.7, // Ajusta este valor según tus necesidades
                      ),
                      itemCount: _filteredMovies.length,
                      itemBuilder: (context, index) {
                        if (index >= _filteredMovies.length) {
                          print("Index out of range: $index");
                          return Container(
                            width: 200,
                          );
                        }
                        Movie movie = _filteredMovies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieScreen(movie: movie),
                              ),
                            );
                          },
                          child: MovieCard(
                            movie: movie,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ]),
      endDrawer: widget_side_bar(getLikedMovies: getLikedMovies),
    );
  }
}

List<Movie> getLikedList(List<Movie> movies) {
  return movies.where((movie) => movie.liked == true).toList();
}
