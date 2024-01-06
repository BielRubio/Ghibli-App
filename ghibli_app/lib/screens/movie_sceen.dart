import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

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
              'MOVIE',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: Placeholder(),
    );
  }
}