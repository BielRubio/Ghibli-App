import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
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
           Image.asset(
              "assets/images/logo_ghibli.png",
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    Text(
                      widget.character.name,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 7),
                    Row(
                      children: [
                        Text(
                          "Gender: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.character.gender,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Eye Color: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.character.eye_color,
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
