import 'dart:async';

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
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 6,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 20 / 15,
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
                      providerName: 'Digi-payt',
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.blue,
                child: GraphboxContainer(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator() // Show loading spinner
                        : SfCartesianChart(
                            title: const ChartTitle(text: 'Provider Graph'),
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
                              title: AxisTitle(text: 'Graph'),
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
            ],
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
    Key? key,
    required this.imagePath,
    required this.providerName,
  }) : super(key: key);

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
