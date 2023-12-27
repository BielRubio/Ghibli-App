import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class SpeciesCard extends StatefulWidget {
  final Specie species;

  const SpeciesCard({
    Key? key,
    required this.species,
  }) : super(key: key);

  @override
  State<SpeciesCard> createState() => _SpeciesCardState();
}

class _SpeciesCardState extends State<SpeciesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 200,
      height: 220,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 176, 182, 178),
        border: Border.all(
          width: 5,
          color: Color.fromARGB(255, 70, 71, 71),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo_ghibli.png",
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.species.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      const Text(
                        "Classification: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        widget.species.classification,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ]),
                    Row(children: [
                      const Text(
                        "Eye colours: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.species.eye_colors,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      const Text(
                        "Hair colours: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.species.hair_colors,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      const Text(
                        "Film: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        widget.species.film_name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
