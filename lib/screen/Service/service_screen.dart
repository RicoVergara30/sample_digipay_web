import 'package:flutter/material.dart';
import 'package:project_digipayweb/widgets/neumorphic.dart';
import 'package:project_digipayweb/widgets/transactionBox.dart';

import '../../widgets/stepper_circle.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    String getStepDescription(int step) {
      switch (step) {
        case 0:
          return 'Choose Network';
        case 1:
          return 'Mobile Numbers';
        case 2:
          return 'Choose Product';
        default:
          return 'Provider';
      }
    }

    void _onStepContinue() {
      setState(() {
        if (currentStep < 4) {
          currentStep++;
        }
      });
    }

    void _onStepCancel() {
      setState(() {
        if (currentStep > 0) {
          currentStep--;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mercury Service',
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
        padding: const EdgeInsets.only(
          left: 50,
          top: 5.0,
          right: 50,
        ),
        child: Row(
          children: [
            Container(
              height: 700,
              width: 350,
              color: Colors.grey.shade100,
              child: TransactionContainer(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (i < currentStep)
                            GestureDetector(
                              onTap: () {
                                // Navigate back to step 'i'
                                setState(() {
                                  currentStep = i;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          else if (i == currentStep)
                            CircleStepper(
                              borderColor: Colors.redAccent, // last ly
                              secondBorderColor: Colors.redAccent, //second ly
                              stepperColor: Colors.white70, // inner
                              padding: 10,
                              shadowColor: Colors.white,
                              child: Text(
                                '${i + 1}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          else
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${i + 1}',
                                  style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)
                                      .copyWith(
                                          color: Colors
                                              .black), // Placeholder text color for inactive steps
                                ),
                              ),
                            ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'STEP ${i + 1}',
                                style: currentStep == i
                                    ? const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors
                                            .black) // Active step text style
                                    : const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)
                                        .copyWith(
                                            color: Colors
                                                .black), // Inactive step text style
                              ),
                              Text(
                                getStepDescription(i),
                                style: currentStep == i
                                    ? const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .black) // Active step description style
                                    : const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)
                                        .copyWith(
                                            color: Colors
                                                .black), // Inactive step description style
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (1 < 4)
                        Container(
                          margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
                        ),
                    ],
                  ],
                ),
              ),
            ),

            //Button
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        child: Container(
                          child: stepContent(currentStep),
                        ),
                      )),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Space between buttons
                        children: [
                          // "Previous" Button
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentStep > 0 ? _onStepCancel() : null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.grey, // Button background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                                side: const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0), // Border color and width
                              ),
                            ),
                            child: const Text(
                              'Previous',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 20), // Space between buttons

                          // "Next" Button
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentStep < 4 ? _onStepContinue() : null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.grey, // Button background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                                side: const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0), // Border color and width
                              ),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showFormDialog(BuildContext context, Map<String, dynamic> server) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return FormServerSwitch(
  //         onFetchServerList: getServerList,
  //         operation: 1,
  //         serverItem: server,
  //       );
  //     },
  //   );
  // }

  Widget stepContent(int step) {
    switch (step) {
      case 0:
        return providerContent1();
      case 1:
        return inputNumber();
      case 2:
        return providerContent3();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget providerContent1() {
    final List<String> providerImages = [
      'assets/smartLogo.png',
      'assets/Atmprovider.png',
      'assets/globeLogo.png',
      'assets/dgipay.png',
      'assets/bayadcenter.png',
    ];

    return GridView.builder(
      shrinkWrap:
          true, // Makes the grid take up only as much space as its children
      physics:
          const NeverScrollableScrollPhysics(), // Prevents scrolling if not needed
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 18 / 7,
      ),
      itemCount: providerImages.length, // Number of grid items
      itemBuilder: (context, index) {
        return SizedBox(
          width: 110,
          height: 100,
          child: NeumorphicContainer(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  providerImages[index],
                  width: 100,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget inputNumber() {
    return const Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers content vertically
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centers content horizontally
        children: [
          Text(
            'Input Number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16), // Adds spacing between Text and TextField
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter number',
              border: OutlineInputBorder(),
              hintText: 'e.g., 123',
            ),
          ),
        ],
      ),
    );
  }

  Widget providerContent3() {
    return Container(
      color: Colors.blue.shade100,
      child: const Text('Provider 3'),
    );
  }
}
