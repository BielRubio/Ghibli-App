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
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 200,
      height: 180,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
           Image.asset(
              "assets/images/logo_ghibli.png",
              
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    Text(
                      widget.location.name,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 7),
                    Row(
                      children: [
                        const Text(
                          "Climate: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.location.climate,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Terrain: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.location.terrain,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
