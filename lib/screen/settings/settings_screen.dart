import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_digipayweb/api/components/baseURL/settings.dart';
import 'package:project_digipayweb/api/components/models/settingsModel.dart';
import 'package:project_digipayweb/widgets/graphbox.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  late Future<DescriptionVendors?> vendorData;
  late TabController _tabController;
  int _currentPage = 0;
  final int _rowsPerPage = 10; // Number of rows per page
  final int _totalPages = 0;
  late List<DescriptionVendors> _currentVendors;
  @override
  void initState() {
    super.initState();
    vendorData =
        fetchVendorData(); // Fetch vendor data when the screen is loaded
    _tabController =
        TabController(length: 3, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when done
    super.dispose();
  }

  // Method to calculate the vendors to be displayed on the current page
  List<DescriptionVendors> _getPageData(List<DescriptionVendors> vendors) {
    final startIndex = _currentPage * _rowsPerPage;
    final endIndex = (startIndex + _rowsPerPage) > vendors.length
        ? vendors.length
        : startIndex + _rowsPerPage;

    return vendors.sublist(startIndex, endIndex);
  }

  // Method to go to the next page
  void _nextPage(List<DescriptionVendors> vendors) {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
        _currentVendors = _getPageData(vendors);
      });
    }
  }

  // Method to go to the previous page
  void _previousPage(List<DescriptionVendors> vendors) {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _currentVendors = _getPageData(vendors);
      });
    }
  }

  // Method to format date to the desired format
  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'N/A';
    }

    try {
      final parsedDate = DateTime.parse(date);
      final formatter = DateFormat(
          'MM/dd/yyyy hh:mm a'); // Month/Date/Year hours:minutes AM/PM
      return formatter.format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe gesture
          tabs: const [
            Tab(
              child: Text(
                'General Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'View API',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Tab(
            //   child: Text(
            //     'Update API',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            Tab(
              child: Text(
                'Add API',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // Disable swipe gesture
        controller: _tabController,
        children: [
          // General API Tab
          _buildGeneralApi(),

          // View API Tab
          _buildViewApi(),

          // Update API Tab
          // _buildUpdateApi(),

          // Add API Tab
          _buildAddApi(),
        ],
      ),
    );
  }

  // General API Section
  Widget _buildGeneralApi() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username:'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Password:'),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Change Password:'),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter new password',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // View API Section (Showing the Data Table)
  Widget _buildViewApi() {
    return Center(
      child: FutureBuilder<DescriptionVendors?>(
        future: vendorData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No Data Available');
          } else {
            final vendors = snapshot.data?.data ?? [];

            // Get only 10 vendors based on the current page
            final startIndex = _currentPage * 10;
            final endIndex = (startIndex + 50) > vendors.length
                ? vendors.length
                : (startIndex + 10);
            final vendorsToDisplay = vendors.sublist(startIndex, endIndex);

            return SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GraphboxContainer(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.redAccent.shade200),
                        headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Vendor Code')),
                          DataColumn(label: Text('Vendor Name')),
                          DataColumn(label: Text('Service Code')),
                          DataColumn(label: Text('Service Name')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Service Type')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Is Enabled')),
                          DataColumn(label: Text('Encoded By')),
                          DataColumn(label: Text('Created By')),
                          DataColumn(label: Text('Updated By')),
                        ],
                        rows: vendorsToDisplay.map<DataRow>((vendor) {
                          return DataRow(cells: [
                            DataCell(Row(
                              children: [
                                const Icon(Icons.code,
                                    size: 16, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text(vendor.vendorCode ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.store,
                                    size: 16, color: Colors.green),
                                const SizedBox(width: 8),
                                Text(vendor.vendorName ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.business,
                                    size: 16, color: Colors.orange),
                                const SizedBox(width: 8),
                                Text(vendor.serviceCode ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.archive,
                                    size: 16, color: Colors.purple),
                                const SizedBox(width: 8),
                                Text(vendor.serviceName ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.description,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(vendor.description ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Icon(
                                  _getServiceIcon(vendor.serviceType ?? 0),
                                  color:
                                      _getServiceColor(vendor.serviceType ?? 0),
                                ),
                                const SizedBox(width: 8),
                                Text(_getServiceType(vendor.serviceType ?? 0)),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Icon(
                                  _getStatusIcon(vendor.status ?? 0),
                                  color: _getStatusColor(vendor.status ?? 0),
                                ),
                                const SizedBox(width: 8),
                                Text(_getStatus(vendor.status ?? 0)),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                _getIsEnabledIcon(vendor.isEnabled ?? false),
                                const SizedBox(width: 8),
                                Text(_getIsEnabled(vendor.isEnabled ?? false)),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.person,
                                    size: 16, color: Colors.indigo),
                                const SizedBox(width: 8),
                                Text(vendor.encodedBy ?? 'N/A'),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.create,
                                    size: 16, color: Colors.greenAccent),
                                const SizedBox(width: 8),
                                Text(formatDate(vendor.createdAt)),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.update,
                                    size: 16, color: Colors.orangeAccent),
                                const SizedBox(width: 8),
                                Text(formatDate(vendor.updatedAt)),
                              ],
                            )),
                          ]);
                        }).toList(),
                        columnSpacing: 80.0,
                        headingRowHeight: 50.0,
                        border: TableBorder.all(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  // Pagination Row
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _currentPage > 0
                              ? () => setState(() {
                                    _currentPage--;
                                  })
                              : null,
                        ),
                        Text('Page ${_currentPage + 1} of $_totalPages'),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: _currentPage < _totalPages - 1
                              ? () => setState(() {
                                    _currentPage++;
                                  })
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Update API Section (Show the same table with an action column)
  // Widget _buildUpdateApi() {
  //   return Center(
  //     child: FutureBuilder<DescriptionVendors?>(
  //       future: vendorData,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const CircularProgressIndicator();
  //         } else if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         } else if (!snapshot.hasData ||
  //             (snapshot.data?.data?.isEmpty ?? true)) {
  //           return const Text('No Data Available');
  //         } else {
  //           final vendors = snapshot.data!.data!;
  //           final totalPages = (vendors.length / 10).ceil();
  //
  //           // Calculate the vendors to display for the current page
  //           final startIndex = _currentPage * 10;
  //           final endIndex = startIndex + 10 > vendors.length
  //               ? vendors.length
  //               : startIndex + 10;
  //           final vendorsToDisplay = vendors.sublist(startIndex, endIndex);
  //
  //           return Column(
  //             children: [
  //               // DataTable displaying vendor data
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: DataTable(
  //                   columns: const [
  //                     DataColumn(label: Text('Vendor Code')),
  //                     DataColumn(label: Text('Vendor Name')),
  //                     DataColumn(label: Text('Service Code')),
  //                     DataColumn(label: Text('Service Name')),
  //                     DataColumn(label: Text('Base URL')),
  //                     DataColumn(label: Text('Port')),
  //                     DataColumn(label: Text('Endpoint')),
  //                     DataColumn(label: Text('Method')),
  //                     DataColumn(label: Text('Description')),
  //                     DataColumn(label: Text('Service Type')),
  //                     DataColumn(label: Text('Status')),
  //                     DataColumn(label: Text('Is Enabled')),
  //                     DataColumn(label: Text('Encoded By')),
  //                     DataColumn(label: Text('Created By')),
  //                     DataColumn(label: Text('Updated By')),
  //                     DataColumn(label: Text('Action')), // Action Column
  //                   ],
  //                   rows: vendorsToDisplay.map<DataRow>((vendor) {
  //                     return DataRow(
  //                       cells: [
  //                         DataCell(Text(vendor.vendorCode ?? 'N/A')),
  //                         DataCell(Text(vendor.vendorName ?? 'N/A')),
  //                         DataCell(Text(vendor.serviceCode ?? 'N/A')),
  //                         DataCell(Text(vendor.serviceName ?? 'N/A')),
  //                         DataCell(Text(vendor.baseUrl ?? 'N/A')),
  //                         DataCell(Text(vendor.port?.toString() ?? 'N/A')),
  //                         DataCell(Text(vendor.endpoint ?? 'N/A')),
  //                         DataCell(Text(vendor.method ?? 'N/A')),
  //                         DataCell(Text(vendor.description ?? 'N/A')),
  //                         DataCell(
  //                             Text(_getServiceType(vendor.serviceType ?? 0))),
  //                         DataCell(Text(_getStatus(vendor.status ?? 0))),
  //                         DataCell(
  //                             Text(_getIsEnabled(vendor.isEnabled ?? false))),
  //                         DataCell(Text(vendor.encodedBy ?? 'N/A')),
  //                         DataCell(Text(vendor.createdAt ?? 'N/A')),
  //                         DataCell(Text(vendor.updatedAt ?? 'N/A')),
  //                         DataCell(
  //                           IconButton(
  //                             icon: const Icon(Icons.edit),
  //                             onPressed: () {
  //                               // Implement the update action here
  //                               print('Edit vendor: ${vendor.vendorCode}');
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     );
  //                   }).toList(),
  //                 ),
  //               ),
  //               // Pagination controls
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   IconButton(
  //                     icon: const Icon(Icons.arrow_back),
  //                     onPressed: _currentPage > 0
  //                         ? () => setState(() {
  //                               _currentPage--;
  //                             })
  //                         : null,
  //                   ),
  //                   Text('Page ${_currentPage + 1} of $totalPages'),
  //                   IconButton(
  //                     icon: const Icon(Icons.arrow_forward),
  //                     onPressed: _currentPage < totalPages - 1
  //                         ? () => setState(() {
  //                               _currentPage++;
  //                             })
  //                         : null,
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  // Add API Section (Add new vendor)
  Widget _buildAddApi() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vendor Code:'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter vendor code',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Vendor Name:'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter vendor name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text('Service Type:'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter service type',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to get service type icon
  IconData _getServiceIcon(int serviceType) {
    switch (serviceType) {
      case 1:
        return Icons.local_hospital; // Example: Health Check
      case 2:
        return Icons.electric_car; // Example: E-Load
      case 3:
        return Icons.account_balance; // Example: Banking
      case 4:
        return Icons.add_business; // Example: Other
      default:
        return Icons.help_outline;
    }
  }

  // Helper function to get service type color
  Color _getServiceColor(int serviceType) {
    switch (serviceType) {
      case 1:
        return Colors.green; // Health Check
      case 2:
        return Colors.blue; // E-Load
      case 3:
        return Colors.orange; // Banking
      case 4:
        return Colors.purple; // Other
      default:
        return Colors.grey;
    }
  }

  // Helper function to get status icon
  IconData _getStatusIcon(int status) {
    switch (status) {
      case 0:
        return Icons.not_interested; // Not Available
      case 1:
        return Icons.check_circle; // Available
      case 2:
        return Icons.build; // Maintenance
      default:
        return Icons.help_outline;
    }
  }

  // Helper function to get status color
  Color _getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.red; // Not Available
      case 1:
        return Colors.green; // Available
      case 2:
        return Colors.orange; // Maintenance
      default:
        return Colors.grey;
    }
  }

  // Is Enabled mapping
  String _getIsEnabled(bool isEnabled) {
    return isEnabled ? 'VIEWABLE' : 'NOT VIEWABLE';
  }

  // Icon for Is Enabled
  Widget _getIsEnabledIcon(bool isEnabled) {
    return isEnabled
        ? const Icon(Icons.visibility, size: 16, color: Colors.green)
        : const Icon(Icons.visibility_off, size: 16, color: Colors.grey);
  }

  // Helper function to get service type name
  String _getServiceType(int serviceType) {
    switch (serviceType) {
      case 1:
        return 'HEALTH CHECK';
      case 2:
        return 'E-LOAD';
      case 3:
        return 'BANKING';
      case 4:
        return 'OTHER';
      default:
        return 'N/A';
    }
  }

  // Helper function to get status name
  String _getStatus(int status) {
    switch (status) {
      case 0:
        return 'NOT AVAILABLE';
      case 1:
        return 'AVAILABLE';
      case 2:
        return 'MAINTENANCE';
      default:
        return 'N/A';
    }
  }
}
