import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            // Set the font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 120.0,
          right: 60.0,
        ),
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: 2.10,
          crossAxisCount: 4,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child:
                  _userWidget('User', '10,000', Icons.supervised_user_circle),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _active('In active', '5,000', Icons.notifications_active),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _inactive(
                  'Active', '5,000', Icons.notifications_active_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _inactive(
                  'Active', '5,000', Icons.notifications_active_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userWidget(String title, String value, IconData icon) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 8.0),
          Text(title),
          const SizedBox(height: 8.0),
          Text(value),
        ],
      ),
    );
  }

  Widget _active(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 8.0),
            Text(title),
            const SizedBox(height: 8.0),
            Text(value),
          ],
        ),
      ),
    );
  }

  Widget _inactive(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 8.0),
            Text(title),
            const SizedBox(height: 8.0),
            Text(value),
          ],
        ),
      ),
    );
  }
}
