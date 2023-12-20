import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/location.api.dart';

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
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    Text(
                      widget.location.name,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 7),
                    Row(
                      children: [
                        Text(
                          "Climate: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.location.climate,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Terrain: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.location.terrain,
                          style: TextStyle(color: Colors.black),
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
