import 'package:flutter/material.dart';
import 'package:project_digipayweb/widgets/neumorphic.dart';

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
        backgroundColor: Colors.white,
        title: const Text(
          'Dashboard',
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
          crossAxisCount: 6,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 20 / 15, // Adjust height-to-width ratio
          children: [
            // SMART
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/smartLogo.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  ),
                ],
              ),
            ),
            //
            // ATM
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Atmprovider.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),

            // GLOBE
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/globeLogo.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),

            // DIGI-PAY
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/dgipay.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),

            // BAYAD CENTER
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bayadcenter.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),

            // ECPAY
            NeumorphicContainer(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ecpayprovider.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
