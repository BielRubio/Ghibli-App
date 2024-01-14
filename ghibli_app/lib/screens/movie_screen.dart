// ignore_for_file: override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghibli_app/widgets/movie_side_bar_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late final List<Movie> _movies = const [];
  @override
  List<Movie> getLikedMovies() {
    return getLikedList(_movies);
  }

  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 189, 125),
        toolbarHeight: 80,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(
              'MOVIE     ',
              // ignore: deprecated_member_use
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(widget.movie.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.95,
              child: Container(
                margin: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      blurRadius: 50.0,
                      spreadRadius: 100.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title  / RunTime / DateOfRelease
                    Row(
                      children: [
                        Text(
                          widget.movie.title.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          "${widget.movie.running_time} min",
                          style: TextStyle(fontSize: 15, color: textColor),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          widget.movie.release_date,
                          style: TextStyle(fontSize: 15, color: textColor),
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Score
                    Row(
                      children: [
                        Text(
                          "Rotten Tomatoes:",
                          style: TextStyle(fontSize: 15, color: textColor),
                        ),
                        const Spacer(flex: 1),
                        RatingBarIndicator(
                          rating:
                              (double.parse(widget.movie.rt_score) / 100 * 5),
                          itemCount: 5,
                          itemSize: 30,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        const Spacer(flex: 1),
                        // Like Button
                        IconButton(
                          icon: Icon(
                            size: 30,
                            widget.movie.liked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                widget.movie.liked ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.movie.liked = !widget.movie.liked;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Director: ${widget.movie.director}",
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Producer: ${widget.movie.producer}",
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Description:",
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.movie.description,
                      overflow: TextOverflow.visible,
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: widget_movie_side_bar(
        movieTitle: widget.movie.title,
        speciesURL: widget.movie.speciesUrlList,
      ),
    );
  }
}

List<Movie> getLikedList(List<Movie> movies) {
  return movies.where((movie) => movie.liked == true).toList();
}
