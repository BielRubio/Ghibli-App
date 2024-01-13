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
  String getSpeciesImage(String speciesName) {
    switch (speciesName) {
      case "Human":
        return "assets/images/species/chihiro.png";
      case "Deer":
        return "assets/images/species/deer.png";
      case "Spirit":
        return "assets/images/species/spirit.png";
      case "God":
        return "assets/images/species/god.png";
      case "Cat":
        return "assets/images/species/cat.png";
      case "Totoro":
        return "assets/images/species/totoro.png";
      case "Dragon":
        return "assets/images/species/dragon.png";
      default:
        return "assets/images/ghibli_logo.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    String speciesImage = getSpeciesImage(widget.species.name);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 230, 230, 230).withOpacity(0.0),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: AssetImage("assets/images/species/fondo.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              stops: [0.1, 0.7],
              end: Alignment.centerRight,
              colors: [Colors.white, Colors.white.withOpacity(0.3)],
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                speciesImage,
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.species.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      const Text(
                        "Classification: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.species.classification,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                    Row(children: [
                      const Text(
                        "Eye colours: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.species.eye_colors,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
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
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.species.hair_colors,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
