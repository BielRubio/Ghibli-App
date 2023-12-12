import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.api.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/widgets/movie_card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie),
              SizedBox(width: 10),
              Text('Ghibli Api'),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    id: _movies[index].id,
                    title: _movies[index].title,
                    imageUrl: _movies[index].imageUrl,
                    description: _movies[index].description,
                    director: _movies[index].director,
                    producer: _movies[index].producer,
                    release_date: _movies[index].release_date,
                    running_time: _movies[index].running_time,
                    rt_score: _movies[index].rt_score,
                  );
                },
              ));
  }
}
