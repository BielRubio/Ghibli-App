import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class LocationCard extends StatefulWidget {
  final Location location;

  const LocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  String _getImagePathForTerrain(String terrain) {
    switch (terrain) {
      case 'Mountain':
        return 'assets/images/terrains/mountain.png';
      case 'Hill':
        return 'assets/images/terrains/hill.png';
      case 'Plain':
        return 'assets/images/terrains/plain.png';
      case 'Ocean':
        return 'assets/images/terrains/ocean.png';
      case 'Marsh':
        return 'assets/images/terrains/marsh.png';
      case 'Forest':
        return 'assets/images/terrains/forest.png';
      case 'River':
        return 'assets/images/terrains/river.png';
      case 'City':
        return 'assets/images/terrains/city.png';
      default:
        return 'assets/images/terrains/TODO.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = _getImagePathForTerrain(widget.location.terrain);

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.location.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Row(
                    children: [
                      const Icon(
                        Icons.thermostat,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        widget.location.climate,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.terrain,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        widget.location.terrain,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
