import 'package:flutter/material.dart';

import '../../widgets/neumorphic.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String selectPage = "/Dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Transaction History',
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
          crossAxisCount: 3,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 15 / 7, // Adjust height-to-width ratio
          children: [
            // SMART
            NeumorphicContainer(
              destination: () {
                setState(() {
                  selectPage = '/Dashboard';
                });
              },
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Incoming :',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                      Text(
                        'Deducted :',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ATM
            // NeumorphicContainer(
            //   padding: EdgeInsets.zero,
            //   shape: CircleBorder(),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/Atmprovider.png',
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.cover,
            //       ),
            //       const SizedBox(height: 10),
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             'Incoming :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //           Text(
            //             'Deducted :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            //
            // // GLOBE
            // NeumorphicContainer(
            //   padding: EdgeInsets.zero,
            //   shape: CircleBorder(),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/globeLogo.png',
            //         width: 100,
            //         height: 50,
            //         fit: BoxFit.cover,
            //       ),
            //       const SizedBox(height: 10),
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             'Incoming :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //           Text(
            //             'Deducted :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            //
            // // DIGI-PAY
            // NeumorphicContainer(
            //   padding: EdgeInsets.zero,
            //   shape: CircleBorder(),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/dgipay.png',
            //         width: 100,
            //         height: 50,
            //         fit: BoxFit.cover,
            //       ),
            //       const SizedBox(height: 10),
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             'Incoming :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //           Text(
            //             'Deducted :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            //
            // // BAYAD CENTER
            // NeumorphicContainer(
            //   padding: EdgeInsets.zero,
            //   shape: CircleBorder(),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/bayadCenter.png',
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.cover,
            //       ),
            //       const SizedBox(height: 10),
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             'Incoming :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //           Text(
            //             'Deducted :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            //
            // // ECPAY
            // NeumorphicContainer(
            //   padding: EdgeInsets.zero,
            //   shape: CircleBorder(),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/ecpayprovider.png',
            //         width: 100,
            //         height: 50,
            //         fit: BoxFit.cover,
            //       ),
            //       const SizedBox(height: 10),
            //       const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Text(
            //             'Incoming :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //           Text(
            //             'Deducted :',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10.0,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
