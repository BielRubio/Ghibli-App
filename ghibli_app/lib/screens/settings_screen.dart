import 'package:flutter/material.dart';
import 'package:ghibli_app/widgets/settings_parameter_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              'SETTINGS',
              textScaleFactor: 2,
              style: TextStyle(fontFamily: 'Ghibli'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ACCOUNT",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SettingsParameterToggle(label: "Private Account"),
              SettingsParameterToggle(label: "Delete Account"),
              Text(
                "NOTIFICATIONS",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SettingsParameterToggle(label: "New Deals"),
              SettingsParameterToggle(label: "Friend Requests"),
              SettingsParameterToggle(label: "My Activity Likes"),
              Text(
                "OTHER",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SettingsParameterToggle(label: "Contact Us"),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}
