import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Locations'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('Species'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit App'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}