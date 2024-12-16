// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Added for date formatting
// import 'package:project_digipayweb/api/components/baseURL/settings.dart';
// import 'package:project_digipayweb/api/components/models/settingsModel.dart';
// import 'package:project_digipayweb/widgets/graphbox.dart';
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//   late Future<DescriptionVendors?> _vendorData;
//   int _currentPage = 0; // Placeholder for current page
//
//   @override
//   void initState() {
//     super.initState();
//     _vendorData = fetchVendorData(); // Call the API
//   }
//
//   // Method to format date to the desired format
//   String formatDate(String? date) {
//     if (date == null || date.isEmpty) {
//       return 'N/A';
//     }
//
//     try {
//       final parsedDate = DateTime.parse(date);
//       final formatter =
//           DateFormat('MM/dd/yyyy hh:mm a'); // Format: Month/Day/Year
//       return formatter.format(parsedDate);
//     } catch (e) {
//       return 'Invalid Date';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Configuration',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//               letterSpacing: 1.2,
//               fontFamily: 'Roboto',
//             ),
//           ),
//           elevation: 1,
//           iconTheme: const IconThemeData(
//             color: Colors.black,
//           ),
//           bottom: const TabBar(
//             physics: NeverScrollableScrollPhysics(),
//             tabs: [
//               Tab(
//                 child: Text('General Settings',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//               Tab(
//                 child: Text('View API',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//               Tab(
//                 child: Text('Add API',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: GraphboxContainer(
//                     padding: const EdgeInsets.all(8.0),
//                     color: Colors.grey.shade200,
//                     child: FutureBuilder<DescriptionVendors?>(
//                       future: _vendorData, // Fixed variable name
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         } else if (snapshot.hasError) {
//                           return Center(
//                               child: Text('Error: ${snapshot.error}'));
//                         } else if (!snapshot.hasData ||
//                                 snapshot.data?.data?.isEmpty ??
//                             true) {
//                           return const Center(child: Text('No Data Available'));
//                         } else {
//                           final vendors = snapshot.data?.data ?? [];
//
//                           // Get only 10 vendors based on the current page
//                           final startIndex = _currentPage * 10;
//                           final endIndex = (startIndex + 10) > vendors.length
//                               ? vendors.length
//                               : (startIndex + 10);
//                           final vendorsToDisplay =
//                               vendors.sublist(startIndex, endIndex);
//
//                           return SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: GraphboxContainer(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 15),
//                                     child: DataTable(
//                                       headingRowColor:
//                                           MaterialStateColor.resolveWith(
//                                               (states) =>
//                                                   Colors.redAccent.shade200),
//                                       headingTextStyle: const TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                       columns: const <DataColumn>[
//                                         DataColumn(label: Text('Vendor Code')),
//                                         DataColumn(label: Text('Vendor Name')),
//                                         DataColumn(label: Text('Service Code')),
//                                         DataColumn(label: Text('Service Name')),
//                                         DataColumn(label: Text('Description')),
//                                         DataColumn(label: Text('Service Type')),
//                                         DataColumn(label: Text('Status')),
//                                         DataColumn(label: Text('Is Enabled')),
//                                         DataColumn(label: Text('Encoded By')),
//                                         DataColumn(label: Text('Created By')),
//                                         DataColumn(label: Text('Updated By')),
//                                       ],
//                                       rows: vendorsToDisplay
//                                           .map<DataRow>((vendor) {
//                                         return DataRow(cells: [
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.code,
//                                                   size: 16, color: Colors.blue),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.vendorCode ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.store,
//                                                   size: 16,
//                                                   color: Colors.green),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.vendorName ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.business,
//                                                   size: 16,
//                                                   color: Colors.orange),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.serviceCode ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.archive,
//                                                   size: 16,
//                                                   color: Colors.purple),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.serviceName ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.description,
//                                                   size: 16, color: Colors.grey),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.description ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               Icon(
//                                                 _getServiceIcon(
//                                                     vendor.serviceType ?? 0),
//                                                 color: _getServiceColor(
//                                                     vendor.serviceType ?? 0),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Text(_getServiceType(
//                                                   vendor.serviceType ?? 0)),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               Icon(
//                                                 _getStatusIcon(
//                                                     vendor.status ?? 0),
//                                                 color: _getStatusColor(
//                                                     vendor.status ?? 0),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Text(_getStatus(
//                                                   vendor.status ?? 0)),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               _getIsEnabledIcon(
//                                                   vendor.isEnabled ?? false),
//                                               const SizedBox(width: 8),
//                                               Text(_getIsEnabled(
//                                                   vendor.isEnabled ?? false)),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.person,
//                                                   size: 16,
//                                                   color: Colors.indigo),
//                                               const SizedBox(width: 8),
//                                               Text(vendor.encodedBy ?? 'N/A'),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.create,
//                                                   size: 16,
//                                                   color: Colors.greenAccent),
//                                               const SizedBox(width: 8),
//                                               Text(
//                                                   formatDate(vendor.createdAt)),
//                                             ],
//                                           )),
//                                           DataCell(Row(
//                                             children: [
//                                               const Icon(Icons.update,
//                                                   size: 16,
//                                                   color: Colors.orangeAccent),
//                                               const SizedBox(width: 8),
//                                               Text(
//                                                   formatDate(vendor.updatedAt)),
//                                             ],
//                                           )),
//                                         ]);
//                                       }).toList(),
//                                       columnSpacing: 80.0,
//                                       headingRowHeight: 50.0,
//                                       border: TableBorder.all(
//                                         color: Colors.grey.shade400,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // Pagination Row (Add pagination widget here if needed)
//                               ],
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: GraphboxContainer(
//                     padding: const EdgeInsets.all(8.0),
//                     color: Colors.grey.shade200,
//                     child: const Row(),
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: GraphboxContainer(
//                     padding: const EdgeInsets.all(8.0),
//                     color: Colors.grey.shade200,
//                     child: const Row(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Helper function to get service type icon
// IconData _getServiceIcon(int serviceType) {
//   switch (serviceType) {
//     case 1:
//       return Icons.local_hospital; // Example: Health Check
//     case 2:
//       return Icons.electric_car; // Example: E-Load
//     case 3:
//       return Icons.account_balance; // Example: Banking
//     case 4:
//       return Icons.add_business; // Example: Other
//     default:
//       return Icons.help_outline;
//   }
// }
//
// // Helper function to get service type color
// Color _getServiceColor(int serviceType) {
//   switch (serviceType) {
//     case 1:
//       return Colors.green; // Health Check
//     case 2:
//       return Colors.blue; // E-Load
//     case 3:
//       return Colors.orange; // Banking
//     case 4:
//       return Colors.purple; // Other
//     default:
//       return Colors.grey;
//   }
// }
//
// // Helper function to get status icon
// IconData _getStatusIcon(int status) {
//   switch (status) {
//     case 0:
//       return Icons.not_interested; // Not Available
//     case 1:
//       return Icons.check_circle; // Available
//     case 2:
//       return Icons.build; // Maintenance
//     default:
//       return Icons.help_outline;
//   }
// }
//
// // Helper function to get status color
// Color _getStatusColor(int status) {
//   switch (status) {
//     case 0:
//       return Colors.red; // Not Available
//     case 1:
//       return Colors.green; // Available
//     case 2:
//       return Colors.orange; // Maintenance
//     default:
//       return Colors.grey;
//   }
// }
//
// // Is Enabled mapping
// String _getIsEnabled(bool isEnabled) {
//   return isEnabled ? 'VIEWABLE' : 'NOT VIEWABLE';
// }
//
// // Icon for Is Enabled
// Widget _getIsEnabledIcon(bool isEnabled) {
//   return isEnabled
//       ? const Icon(Icons.visibility, size: 16, color: Colors.green)
//       : const Icon(Icons.visibility_off, size: 16, color: Colors.grey);
// }
//
// // Helper function to get service type name
// String _getServiceType(int serviceType) {
//   switch (serviceType) {
//     case 1:
//       return 'HEALTH CHECK';
//     case 2:
//       return 'E-LOAD';
//     case 3:
//       return 'BANKING';
//     case 4:
//       return 'OTHER';
//     default:
//       return 'N/A';
//   }
// }
//
// // Helper function to get status name
// String _getStatus(int status) {
//   switch (status) {
//     case 0:
//       return 'NOT AVAILABLE';
//     case 1:
//       return 'AVAILABLE';
//     case 2:
//       return 'MAINTENANCE';
//     default:
//       return 'N/A';
//   }
// }
