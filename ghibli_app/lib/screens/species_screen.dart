import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/species.api.dart';
import 'package:ghibli_app/widgets/species_card_widget.dart';

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({super.key});

  @override
  _SpeciesScreenState createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  late List<Specie> _species;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLoaction();
  }

  Future<void> getLoaction() async {
    _species = await SpeciesApi.getSpecies();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 189, 125),
        toolbarHeight: 80,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(
              'ALL SPECIES',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _species.length,
              itemBuilder: (context, index) {
                return SpeciesCard(
                  species: _species[index],
                );
              },
            ),
    );
  }
}
