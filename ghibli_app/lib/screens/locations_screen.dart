import 'package:flutter/material.dart';
import 'package:ghibli_app/model/movie.dart';
import 'package:ghibli_app/model/location.api.dart';
import 'package:ghibli_app/widgets/location_carad_widget.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late List<Location> _locations;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLoaction();
  }

  Future<void> getLoaction() async {
    _locations = await LoactionApi.getLocations();
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
              'ALL LOCATIONS',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                return LocationCard(
                  location: _locations[index],
                );
              },
            ),
    );
  }
}
