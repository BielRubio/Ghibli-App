import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

const double height = 120;

class SettingsParameterToggle extends StatefulWidget {
  const SettingsParameterToggle(
      {super.key, required this.label, required this.toggle});

  final String label;
  final bool toggle;

  @override
  State<SettingsParameterToggle> createState() =>
      _SettingsParameterToggleState();
}

class _SettingsParameterToggleState extends State<SettingsParameterToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          widget.toggle
              ? ToggleSwitch(
                  minWidth: 50.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.lightBlue.shade100!],
                    [Colors.blueGrey.shade400!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  radiusStyle: true,
                )
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_right_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                    });
                  },
                ),
        ],
      ),
    );
  }
}
