import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ghibli_app/model/themeprovider.dart';
import 'package:ghibli_app/widgets/settings_parameter_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          // Dark Mode Toggle Icon
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              // Toggle the theme mode
              themeProvider
                  .toggleTheme(themeProvider.themeMode != ThemeMode.dark);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACCOUNT",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 84, 84, 84)),
                ),
                SizedBox(
                  height: 10,
                ),
                SettingsParameterToggle(label: "Private Account", toggle: true),
                SettingsParameterToggle(label: "Delete Account", toggle: false),
                // SizedBox(
                //   height: 40,
                // ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 84, 84, 84)),
                ),
                SizedBox(
                  height: 10,
                ),
                SettingsParameterToggle(label: "New Deals", toggle: true),
                SettingsParameterToggle(label: "Friend Requests", toggle: true),
                SettingsParameterToggle(
                    label: "My Activity Likes", toggle: true),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "OTHER",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 84, 84, 84)),
                ),
                SizedBox(
                  height: 10,
                ),
                SettingsParameterToggle(label: "Contact Us", toggle: false),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
    );
  }
}
