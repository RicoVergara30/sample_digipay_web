import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> saveChanges(
  String vendorCode,
  String vendorName,
  String serviceCode,
  String serviceName,
  String description,
  String encodedBy,
  int status,
  bool isEnabled,
) async {
  const String apiUrl =
      "https://dev-mercury.fortress-asya.com:17019/api/public/v1/vendor/update";

  // Create the payload
  final Map<String, dynamic> payload = {
    "vendorCode": vendorCode,
    "vendorName": vendorName,
    "serviceCode": serviceCode,
    "serviceName": serviceName,
    "isEnabled": isEnabled,
    "encodedBy": encodedBy,
    "description": description,
    "status": status,
  };

  // print('Status $status');
  try {
    // Make the API call
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(payload),
    );

    // print(jsonEncode(payload));

    // Handle the response
    if (response.statusCode == 200) {
      // Success
      print("Vendor details updated successfully.");
      // _showSnackBar("Vendor details updated successfully.");
    } else {
      // Error
      print("Failed to update vendor details: ${response.body}");
      // _showSnackBar("Failed to update vendor details. Please try again.");
    }
  } catch (error) {
    // Network or other errors
    print("Error updating vendor details: $error");
    // _showSnackBar("An error occurred. Please try again.");
  }
}
