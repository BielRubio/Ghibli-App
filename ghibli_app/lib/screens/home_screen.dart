import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: movie,
      child: Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}
