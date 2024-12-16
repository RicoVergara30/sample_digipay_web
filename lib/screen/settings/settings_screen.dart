import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_digipayweb/api/components/baseURL/settings.dart';
import 'package:project_digipayweb/api/components/models/settingsModel.dart';
import 'package:project_digipayweb/widgets/graphbox.dart';

import '../../api/components/baseURL/updateVendor.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Future<DescriptionVendors?> _vendorData;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _vendorData = fetchVendorData();
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'N/A';
    }

    try {
      final parsedDate = DateTime.parse(date);
      final formatter = DateFormat('MM/dd/yyyy hh:mm a');
      return formatter.format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  // Method to handle page change
  void _changePage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Configuration',
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
          bottom: const TabBar(
            physics: NeverScrollableScrollPhysics(),
            tabs: [
              Tab(
                child: Text('Settings',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Tab(
                child: Text('General API',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Tab(
                child: Text('Add API',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GraphboxContainer(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey.shade200,
                    child: const Center(child: Text('Settings Content')),
                  ),
                ),
              ),
            ),
            // General API Tab
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GraphboxContainer(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey.shade200,
                    child: FutureBuilder<DescriptionVendors?>(
                      future: _vendorData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.data!.isEmpty) {
                          return const Center(child: Text('No Data Available'));
                        } else {
                          final vendors = snapshot.data?.data ?? [];
                          final startIndex = _currentPage * 12;
                          final endIndex = (startIndex + 12) > vendors.length
                              ? vendors.length
                              : (startIndex + 13);
                          final vendorsToDisplay =
                              vendors.sublist(startIndex, endIndex);
                          return Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        headingRowColor:
                                            WidgetStateColor.resolveWith(
                                                (states) =>
                                                    Colors.redAccent.shade100),
                                        headingTextStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        columns: const <DataColumn>[
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Vendor Code'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Vendor Name'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Service Code'))),
                                          DataColumn(
                                              label: Text('Service Name')),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Description'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Service Type'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Status'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Is Enabled'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Encoded By'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Created By'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Updated By'))),
                                          DataColumn(
                                              label: Center(
                                                  child: Text('Action'))),
                                        ],
                                        rows: vendorsToDisplay
                                            .map<DataRow>((vendor) {
                                          return DataRow(cells: [
                                            DataCell(Center(
                                                child: Text(vendor.vendorCode ??
                                                    'N/A'))),
                                            DataCell(Center(
                                                child: Text(vendor.vendorName ??
                                                    'N/A'))),
                                            DataCell(Center(
                                                child: Text(
                                                    vendor.serviceCode ??
                                                        'N/A'))),
                                            DataCell(Center(
                                                child: Text(
                                                    vendor.serviceName ??
                                                        'N/A'))),
                                            DataCell(Center(
                                                child: Text(
                                                    vendor.description ??
                                                        'N/A'))),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                        _getStatusIcon(
                                                            vendor.status ?? 0),
                                                        color: _getStatusColor(
                                                            vendor.status ??
                                                                0)),
                                                    const SizedBox(width: 8),
                                                    Text(_getServiceType(
                                                        vendor.serviceType ??
                                                            0)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      _getStatusIcon(
                                                          vendor.status ?? 0),
                                                      color: _getStatusColor(
                                                          vendor.status ?? 0),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(_getStatus(
                                                        vendor.status ?? 0)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    _getIsEnabledIcon(
                                                        vendor.isEnabled ??
                                                            false),
                                                    const SizedBox(width: 8.0),
                                                    Text(_getIsEnabled(
                                                        vendor.isEnabled ??
                                                            false)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(
                                                      Icons.person,
                                                      size: 16,
                                                      color: Colors.indigo,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(vendor.encodedBy ??
                                                        'N/A'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(Center(
                                              child: Text(
                                                  formatDate(vendor.createdAt)),
                                            )),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(
                                                      Icons.update,
                                                      size: 16,
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(formatDate(
                                                        vendor.updatedAt)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Row(
                                                children: [
                                                  _actionBox(context, vendor,
                                                      formatDate),
                                                ],
                                              ),
                                            )
                                          ]);
                                        }).toList(),
                                        columnSpacing: 80.0,
                                        headingRowHeight: 50.0,
                                        border: TableBorder.all(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -10.0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_ios),
                                      iconSize: 15.0,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      visualDensity: VisualDensity.compact,
                                      onPressed: _currentPage > 0
                                          ? () => _changePage(_currentPage - 1)
                                          : null,
                                    ),
                                    Text(
                                      'PAGE ${_currentPage + 1}',
                                      style: const TextStyle(fontSize: 11.0),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      iconSize: 15.0,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      visualDensity: VisualDensity.compact,
                                      onPressed: (_currentPage + 1) * 12 <
                                              vendors.length
                                          ? () => _changePage(_currentPage + 1)
                                          : null,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Add API Tab
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GraphboxContainer(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey.shade200,
                    child: const Center(child: Text('Add API Tab Content')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _actionBox(
    BuildContext context, Data vendor, String Function(String?) formatDate) {
  return IconButton(
    icon: const Icon(
      Icons.edit,
      size: 20,
    ),
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Vendor Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                  fontFamily: 'Roboto',
                )),
            content: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Vendor Code:', vendor.vendorCode ?? 'N/A'),
                  _buildDetailRow('Vendor Name:', vendor.vendorName ?? 'N/A'),
                  _buildDetailRow('Service Code:', vendor.serviceCode ?? 'N/A'),
                  _buildDetailRow('Service Name:', vendor.serviceName ?? 'N/A'),
                  _buildDetailRow('Description:', vendor.description ?? 'N/A'),
                  _buildDetailRow('Status:', _getStatus(vendor.status ?? 0)),
                  _buildDetailRow('Service Type:',
                      _getServiceType(vendor.serviceType ?? 0)),
                  _buildDetailRow(
                      'Enabled:', _getIsEnabled(vendor.isEnabled ?? false)),
                  _buildDetailRow('Encoded By:', vendor.encodedBy ?? 'N/A'),
                  _buildDetailRow('Created At:', formatDate(vendor.createdAt)),
                  _buildDetailRow('Updated At:', formatDate(vendor.updatedAt)),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _editableActionBox(
                      context, vendor, formatDate); // Close details dialog
                },
                child: const Text("Update"),
              ),
            ],
          );
        },
      );
    },
  );
}

final TextEditingController vCodeController = TextEditingController();
final TextEditingController vNameController = TextEditingController();
final TextEditingController sCodeController = TextEditingController();
final TextEditingController sNameController = TextEditingController();
final TextEditingController descController = TextEditingController();
final TextEditingController encodeController = TextEditingController();

int status = 0; // Default to NOT AVAILABLE
bool isEnabled = false; // Default to NOT VIEWABLE

void _editableActionBox(
    BuildContext context, Data vendor, String Function(String?) formatDate) {
  vCodeController.text = vendor.vendorCode ?? '';
  vNameController.text = vendor.vendorName ?? '';
  sCodeController.text = vendor.serviceCode ?? '';
  sNameController.text = vendor.serviceName ?? '';
  descController.text = vendor.description ?? '';
  encodeController.text = vendor.encodedBy ?? '';
  status = vendor.status ?? 0; // Initialize with vendor's value
  isEnabled = vendor.isEnabled ?? false; // Initialize with vendor's value

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Edit Vendor Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEditableDetailRow('Vendor Code:', vCodeController),
                _buildEditableDetailRow('Vendor Name:', vNameController),
                _buildEditableDetailRow('Service Code:', sCodeController),
                _buildEditableDetailRow('Service Name:', sNameController),
                _buildEditableDetailRow('Description:', descController),
                _buildEditableDetailRow('Encoded By:', encodeController),
                const SizedBox(height: 15),
                const Text(
                  'status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<int>(
                  value: status,
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('NOT AVAILABLE')),
                    DropdownMenuItem(value: 1, child: Text('AVAILABLE')),
                    DropdownMenuItem(value: 2, child: Text('MAINTENANCE')),
                  ],
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      status = newValue;
                    }
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'isEnabled:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: isEnabled,
                      onChanged: (bool newValue) {
                        isEnabled = newValue;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              print("Save clicked");

              // Update vendor object with new values
              vendor.vendorCode = vCodeController.text;
              vendor.vendorName = vNameController.text;
              vendor.serviceCode = sCodeController.text;
              vendor.serviceName = sNameController.text;
              vendor.description = descController.text;
              vendor.encodedBy = encodeController.text;
              vendor.status = status;
              vendor.isEnabled = isEnabled;

              Navigator.of(context).pop();
              saveChanges(
                vCodeController.text,
                vNameController.text,
                sCodeController.text,
                sNameController.text,
                descController.text,
                encodeController.text,
                status,
                isEnabled,
              );
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}

Widget _buildEditableDetailRow(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$label ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                softWrap: true,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

// Helper function for service type
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

// Helper function for status
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

// Helper function for enabled status
String _getIsEnabled(bool isEnabled) {
  return isEnabled ? 'VIEWABLE' : 'NOT VIEWABLE';
}

// Icon for Is Enabled
Widget _getIsEnabledIcon(bool isEnabled) {
  return isEnabled
      ? const Icon(Icons.visibility, size: 16, color: Colors.green)
      : const Icon(Icons.visibility_off, size: 16, color: Colors.grey);
}
