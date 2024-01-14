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
    Color textColor = Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 34, 34, 34)
        : Colors.white;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACCOUNT",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SettingsParameterToggle(
                        label: "Private Account", toggle: true),
                    const SettingsParameterToggle(
                        label: "Delete Account", toggle: false),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "NOTIFICATIONS",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SettingsParameterToggle(
                        label: "New Deals", toggle: true),
                    const SettingsParameterToggle(
                        label: "Friend Requests", toggle: true),
                    const SettingsParameterToggle(
                        label: "My Activity Likes", toggle: true),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "OTHER",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SettingsParameterToggle(
                        label: "Contact Us", toggle: false),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
