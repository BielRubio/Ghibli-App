import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class LocationCard extends StatefulWidget {
  final Location location;
  final Movie movie;

  const LocationCard({
    Key? key,
    required this.location,
    required this.movie,
  }) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
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
            image: NetworkImage(widget.movie.image),
            fit: BoxFit.cover,
            opacity: 0.1),
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
                        fontSize: 30),
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
