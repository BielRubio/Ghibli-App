import 'package:flutter/material.dart';
import 'package:ghibli_app/screens/home_screen.dart';
import 'package:ghibli_app/model/movie.dart';

void main() {
  runApp(const MyApp());
}

const Movie MovingCastle = Movie(
  id: "macarenaasfidasd",
  title: "Movingcastle",
  imageUrl: "Socrates",
  description: " ",
  director: " ",
  producer: " ",
  release_date: " ",
  running_time: " ",
  rt_score: 5,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(
        movie: MovingCastle,
      ),
    );
  }
}
