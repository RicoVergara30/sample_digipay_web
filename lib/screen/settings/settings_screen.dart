import 'package:flutter/material.dart';
import 'package:project_digipayweb/widgets/transactionBox.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreen();
}

class _settingScreen extends State<settingScreen> {
  bool onHovered = false;
  bool isSwitchOn = true; // Initial state of the switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Setting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 15.0, // Spacing between rows
          crossAxisSpacing: 15.0, // Spacing between columns
          childAspectRatio: 1, // Ensures each container is a square
          children: [
            TransactionContainer(
              padding: EdgeInsets.zero,
              child: Container(
                width: 500, // Fixed width of 1000
                height: 700, // Fixed height of 1000
                color: Colors.grey.shade200, // For visibility
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // You can place widgets inside this container as needed
                    Icon(Icons.settings, size: 50, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'Container 1',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            //
            TransactionContainer(
              padding: EdgeInsets.zero,
              child: Container(
                width: 500, // Fixed width
                height: 600, // Fixed height
                color: Colors.grey.shade200, // For visibility
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Box around Mid-Day and Switch Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Mid-Day with Sun Icon
                            const Row(
                              children: [
                                Icon(Icons.control_point, color: Colors.black),
                                SizedBox(width: 8.0),
                                Text(
                                  "Endpoint",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            // Switch Button with Logic
                            Switch(
                              value: isSwitchOn, // Dynamic value
                              onChanged: (bool newValue) {
                                setState(() {
                                  isSwitchOn = newValue; // Update state
                                });
                              },
                              activeColor: Colors.black, // Active switch color
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
