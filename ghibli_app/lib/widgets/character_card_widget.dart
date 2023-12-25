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
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(103, 196, 123, 1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color.fromARGB(255, 111, 153, 111), width: 3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/logo_ghibli.png",
                scale: 3.5,
              ),
            ),
            SizedBox(width: 16), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.character.name,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  buildRow("Gender", widget.character.gender),
                  buildRow("Age", widget.character.age),
                  buildRow("Eye Color", widget.character.eye_color),
                  buildRow("Hair Color", widget.character.hair_color),
                  buildSpeciesRow("Specie", widget.character.specieID),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget buildSpeciesRow(String label, String apiUrl) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(color: Colors.black),
          ),
          Flexible(
            child: FutureBuilder<String>(
              future: CharacterApi.fetchSpeciesName(apiUrl),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(color: Colors.black),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    "Error fetching species name",
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Text(
                    "Loading...",
                    style: TextStyle(color: Colors.black),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(color: Colors.black),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
