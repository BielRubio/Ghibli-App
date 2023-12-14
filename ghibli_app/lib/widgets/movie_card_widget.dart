import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
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
      child: Stack(
        children: [
          //Like button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                widget.movie.liked ? Icons.favorite : Icons.favorite_border,
                color: widget.movie.liked ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  widget.movie.liked = !widget.movie.liked;
                });
              },
            ),
          ),
          //RT score  and relase data
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //RT score
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Rotten_Tomatoes.png",
                        scale: 10,
                      ),
                      const SizedBox(width: 7),
                      Text("${widget.movie.rt_score}/100"),
                    ],
                  ),
                ),
                //Release date
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_outlined,
                        color: Colors.yellow,
                        size: 21,
                      ),
                      const SizedBox(width: 7),
                      Text(widget.movie.release_date),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
