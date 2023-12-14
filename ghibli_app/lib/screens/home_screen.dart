import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.api.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> _movies;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMovie();
  }

  Future<void> getMovie() async {
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
                'Ghibli App',
                textScaleFactor: 2,
              ),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0, 
              mainAxisSpacing: 8.0, 
              childAspectRatio: 0.7,
            ),
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: _movies[index],
              );
            },
          ),
  );
  }
}
