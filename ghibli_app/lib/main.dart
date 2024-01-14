import 'package:flutter/material.dart';
import 'package:ghibli_app/screens/home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:ghibli_app/model/themeprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(), // Define light theme here
          darkTheme: ThemeData.dark(), // Define dark theme here
          home: const HomeScreen(),
        );
      },
    );
  }
}
