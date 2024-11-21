import 'package:flutter/material.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink,
      ),
    );
  }
}
