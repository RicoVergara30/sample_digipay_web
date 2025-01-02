import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_digipayweb/api/components/baseURL/connection.dart';
import 'package:project_digipayweb/api/components/models/model.dart';
import 'package:project_digipayweb/provider/idleTime.dart';
import 'package:project_digipayweb/widgets/graphbox.dart';
import 'package:project_digipayweb/widgets/neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Transaction> fetchGraphData = []; // To hold the data for the graph
  bool isLoading = true; // To handle loading state
  String? errorMessage; // To display error messages
  Timer? _timer;
  final List<String> _carouselImages = [
    'assets/images/eload-services.png',
    'assets/images/mobile-money.png',
    'assets/images/bills-payment.png',
    'assets/images/eload-services copy.png',
    'assets/images/mobile-money copy.png',
    'assets/images/bills-payment copy.png',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startTimer();
    });
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    final timer = Provider.of<TimerProvider>(context, listen: false);
    timer.startTimer(context);
    timer.buildContext = context;
  }

  void _pauseTimer([_]) {
    _timer?.cancel();
    _startTimer();
  }

  // Function to fetch the data
  Future<void> fetchData() async {
    try {
      final dashboardAPI = DashboardValuesAPI();
      final data =
          await dashboardAPI.fetchTransactions(); // Fetch data from API
      setState(() {
        fetchGraphData = data; // Update the state with the fetched data
        isLoading = false; // Set loading to false once data is fetched
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString(); // Handle errors
        isLoading = false;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerHover: _pauseTimer,
      onPointerMove: _pauseTimer,
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:
                      200.0, // Adjust as needed to fit the GridView properly
                  child: GridView.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 20 / 15,
                    shrinkWrap:
                        true, // Prevent GridView from expanding infinitely
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable GridView's internal scrolling
                    children: const [
                      ProviderCard(
                        imagePath: 'assets/smartLogo.png',
                        providerName: 'Smart',
                      ),
                      ProviderCard(
                        imagePath: 'assets/Atmprovider.png',
                        providerName: 'ATM',
                      ),
                      ProviderCard(
                        imagePath: 'assets/globeLogo.png',
                        providerName: 'Globe',
                      ),
                      ProviderCard(
                        imagePath: 'assets/dgipay.png',
                        providerName: 'Digi-pay',
                      ),
                      ProviderCard(
                        imagePath: 'assets/bayadcenter.png',
                        providerName: 'Bayad Center',
                      ),
                      ProviderCard(
                        imagePath: 'assets/ecpayprovider.png',
                        providerName: 'Ecpay',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GraphboxContainer(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator() // Show loading spinner
                          : SfCartesianChart(
                              title:
                                  const ChartTitle(text: 'Transaction Graph'),
                              legend: const Legend(
                                  position: LegendPosition.right,
                                  isVisible: true),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              primaryXAxis: const CategoryAxis(
                                maximumLabelWidth: 25,
                                labelStyle: TextStyle(
                                  fontSize: 8,
                                  overflow: TextOverflow.visible,
                                ),
                                title: AxisTitle(text: 'Mercury Graph'),
                                majorGridLines:
                                    MajorGridLines(width: 0), // Hide grid lines
                                edgeLabelPlacement: EdgeLabelPlacement.none,
                              ),
                              series: <ColumnSeries<Transaction, String>>[
                                ColumnSeries<Transaction, String>(
                                  color: Colors.blue,
                                  dataSource: fetchGraphData,
                                  xValueMapper: (Transaction data, _) =>
                                      data.monthOf,
                                  yValueMapper: (Transaction data, _) =>
                                      data.successfulTransaction,
                                  name: 'Successful Transactions',
                                  width: 0.5,
                                  spacing: 0.1,
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true),
                                  enableTooltip: true,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 350.0, // Adjusted height to accommodate text
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the container
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0, // Height of each carousel item
                          autoPlay: true, // Automatically scroll through items
                          enlargeCenterPage: false, // Disable enlarge effect
                          aspectRatio: 16 / 9, // Aspect ratio for the carousel
                          viewportFraction:
                              0.3, // Use 80% of the screen width for each item
                        ),
                        items: _carouselImages.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  imagePath, // Dynamically use the path here
                                  fit: BoxFit
                                      .contain, // Adjust the image fit to cover the available space
                                  width: double.infinity,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const Text(
                        "Mercury Service Offers",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProviderCard extends StatelessWidget {
  final String imagePath;
  final String providerName;

  const ProviderCard({
    super.key,
    required this.imagePath,
    required this.providerName,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  "Provider : $providerName",
                  style: const TextStyle(
                    color: Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
