import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/screens/movie_sceen.dart';
import 'package:ghibli_app/widgets/movie_card_widget.dart';

class LikesScreen extends StatefulWidget {

  final List<Movie> likedMovies;
  
  const LikesScreen({super.key, required this.likedMovies});

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 189, 125),
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_ghibli.png",
              scale: 10,
            ),
            const SizedBox(width: 10),
            const Text(
              'GHIBLI REALM',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: Stack(children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: widget.likedMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MovieScreen(movie: widget.likedMovies[index])),
                        );
                    },
                    child: MovieCard(
                      movie: widget.likedMovies[index],
                    ),
                  );
                },
              ),
            ]),
    );
  }
}

