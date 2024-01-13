import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  debugPrint("text = '$text'");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
