// ignore_for_file: deprecated_member_use, unused_local_variable
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
          title: const Text('Settings',
              textScaleFactor: 1.8, style: TextStyle(fontFamily: 'Ghibli')),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 125, 189, 125),
          toolbarHeight: 80,
          actions: <Widget>[
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return IconButton(
                  icon: Icon(
                    themeProvider.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: () {
                    themeProvider
                        .toggleTheme(themeProvider.themeMode != ThemeMode.dark);
                  },
                );
              },
            ),
          ],
        ),
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
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
                    SettingsParameterToggle(
                        label: "Private Account", toggle: true),
                    SettingsParameterToggle(
                        label: "Delete Account", toggle: false),
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
                    SettingsParameterToggle(
                        label: "Friend Requests", toggle: true),
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
        ));
  }
}
