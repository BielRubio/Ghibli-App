import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/character.api.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(103, 196, 123, 1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color.fromARGB(255, 111, 153, 111), width: 3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/logo_ghibli.png",
                scale: 3.5,
              ),
            ),
            const SizedBox(width: 16), 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.character.name,
                      style: const TextStyle(color: Colors.black, fontSize: 25, fontFamily: "Ghibli"),
                    ),
                    buildRow("Gender", widget.character.gender),
                    buildRow("Age", widget.character.age),
                    buildRow("Eye Color", widget.character.eye_color),
                    buildRow("Hair Color", widget.character.hair_color),
                    buildRow("Specie", widget.character.specieName),
                    buildRow("Movie", widget.character.filmName),
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



Widget buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
