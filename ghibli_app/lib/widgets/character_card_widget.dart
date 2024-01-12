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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: widget.character.gender == "Male"
              ? Color.fromARGB(255, 111, 158, 235) // Color azul para Male
              : widget.character.gender == "Female"
                  ? const Color.fromRGBO(
                      244, 144, 177, 1) // Color rosa para Female
                  : Color.fromARGB(255, 137, 230, 157), // Color verde por defecto
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color.fromARGB(255, 92, 92, 92),
            width: 3,
          ),
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
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Ghibli"),
                    ),
                    buildRow("Gender", widget.character.gender, Icon(Icons.wc_rounded)),
                    buildRow("Age", widget.character.age, Icon(Icons.access_time_rounded)),
                    buildRow("Eye Color", widget.character.eye_color, Icon(Icons.remove_red_eye_outlined)),
                    buildRow("Hair Color", widget.character.hair_color, Icon(Icons.face_2)),
                    buildRow("Specie", widget.character.specieName, Icon(Icons.auto_awesome)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, String value, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon.icon),
          Text(
            " $label: ",
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
