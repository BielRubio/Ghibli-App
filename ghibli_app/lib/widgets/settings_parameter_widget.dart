import 'package:flutter/material.dart';

const double height = 120;

class SettingsParameterToggle extends StatefulWidget {
  const SettingsParameterToggle({super.key, required this.label});

  final String label;

  @override
  State<SettingsParameterToggle> createState() =>
      _SettingsParameterToggleState();
}

class _SettingsParameterToggleState extends State<SettingsParameterToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
      ),
      child: Row(
        children: [
          Text(
          widget.label,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
