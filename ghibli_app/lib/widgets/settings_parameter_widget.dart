import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const double height = 120;

class SettingsParameterToggle extends StatefulWidget {
  const SettingsParameterToggle({
    Key? key,
    required this.label,
    required this.toggle,
  }) : super(key: key);

  final String label;
  final bool toggle;

  @override
  State<SettingsParameterToggle> createState() =>
      _SettingsParameterToggleState();
}

class _SettingsParameterToggleState extends State<SettingsParameterToggle> {
  bool valueSwitch = true;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 34, 34, 34)
        : Colors.white;
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 28,
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          widget.toggle
              ? SizedBox(
                  width: 60, // Ajusta el ancho del CupertinoSwitch
                  height: 40, // Ajusta el alto del CupertinoSwitch
                  child: CupertinoSwitch(
                    value: valueSwitch,
                    activeColor: CupertinoColors.activeGreen,
                    onChanged: (bool value) {
                      setState(() {
                        valueSwitch = value;
                      });
                    },
                  ),
                )
              : SizedBox(
                  width: 60, // Ajusta el ancho del IconButton
                  height: 60, // Ajusta el alto del IconButton
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.grey,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
