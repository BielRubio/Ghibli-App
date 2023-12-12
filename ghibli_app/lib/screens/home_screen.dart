import 'package:flutter/material.dart';
import 'package:ghibli_app/widgets/movie_card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Ghibli Api'),
            ],
          ),
        ),
        body: MovieCard(
            id: "id",
            title: "My Neighbor Totoro",
            imageUrl:
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg",
            description:
                "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
            director: "Hayao Miyazaki",
            producer: "Hayao Miyazaki",
            release_date: "1988",
            running_time: "86",
            rt_score: 93));
  }
}
