import 'package:flutter/material.dart';

class serviceScreen extends StatefulWidget {
  const serviceScreen({super.key});

  @override
  State<serviceScreen> createState() => _sserviceScreenState();
}

class _sserviceScreenState extends State<serviceScreen> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
