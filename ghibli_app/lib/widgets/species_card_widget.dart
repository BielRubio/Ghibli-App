import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class SpeciesCard extends StatefulWidget {
  final Location location;

  const SpeciesCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<SpeciesCard> createState() => _SpeciesCardState();
}

class _SpeciesCardState extends State<SpeciesCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
