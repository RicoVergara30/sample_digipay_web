import 'package:flutter/material.dart';

class MenuDrawerTextDesign extends StatefulWidget {
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
    this.suffixIcon,
  });

  @override
  _MenuDrawerTextDesignState createState() => _MenuDrawerTextDesignState();
}

class _MenuDrawerTextDesignState extends State<MenuDrawerTextDesign> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true; // Highlight on mouse enter
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        color: isHovered ? Colors.grey[200] : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (widget.icon != null) Icon(widget.icon, color: Colors.red),
                const SizedBox(width: 10.0),
                Text(
                  widget.menuTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            if (widget.dropdown)
              Icon(
                widget.suffixIcon ?? Icons.keyboard_arrow_down_outlined,
                color: widget.suffixIcon == Icons.keyboard_arrow_right_outlined
                    ? Colors.teal
                    : Colors.red,
              ),
          ],
        ),
      ),
    );
  }
}
