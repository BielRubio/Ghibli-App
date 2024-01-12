import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
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
            Text(
              'MOVIE     ',
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
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          "${widget.movie.running_time} min",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          widget.movie.release_date,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Score
                    Row(
                      children: [
                        const Text(
                          "Rotten Tomatoes:",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(flex: 1),
                        RatingBarIndicator(
                          rating: (double.parse(widget.movie.rt_score) / 100 * 5),
                          itemCount: 5,
                          itemSize: 40,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        const Spacer(flex: 1),
                        // Like Button
                        IconButton(
                          icon: Icon(
                            size: 50,
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
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Producer: ${widget.movie.producer}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Descripcion:",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.movie.description,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
