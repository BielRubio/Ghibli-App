import 'package:flutter/material.dart';
import 'package:ghibli_app/screens/locations_screen.dart';
import 'package:ghibli_app/screens/characters_screen.dart';
import 'package:ghibli_app/screens/settings_screen.dart';
import 'package:ghibli_app/screens/species_screen.dart';
import 'package:flutter/services.dart';

class widget_side_bar extends StatelessWidget {
  const widget_side_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          ListTile(
            leading: const Icon(Icons.favorite),
            iconColor: const Color.fromARGB(255, 216, 38, 26),
            title: const Text('Favorite Films'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Characters'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharactersScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Locations'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LocationsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('Species'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SpeciesScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit App'),
            onTap: () async {
              await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}
