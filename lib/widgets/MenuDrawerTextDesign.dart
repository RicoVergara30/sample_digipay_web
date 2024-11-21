import 'package:flutter/material.dart';

class MenuDrawerTextDesign extends StatelessWidget {
  final String menuTitle;
  final IconData? icon;
  final bool dropdown;
  final List<String>? subItems;
  final IconData? suffixIcon; // Optional suffix icon

  const MenuDrawerTextDesign({
    super.key,
    required this.menuTitle,
    this.icon,
    this.subItems,
    required this.dropdown,
    this.suffixIcon, // Added optional suffixIcon parameter
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusts layout
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.red), // Main icon
            const SizedBox(width: 10.0),
            Text(
              menuTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
        dropdown
            ? Icon(
                suffixIcon ??
                    Icons
                        .keyboard_arrow_down_outlined, // Default to down arrow icon
                color: suffixIcon == Icons.keyboard_arrow_right_outlined
                    ? Colors.grey
                    : Colors
                        .red, // Set grey for right arrow icon, red for others
              )
            : Container(),
      ],
    );
  }
}
