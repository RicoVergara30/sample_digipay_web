import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_digipayweb/api/components/models/settingsModel.dart';

Future<DescriptionVendors?> fetchVendorData() async {
  // Define the API endpoint
  const String apiUrl =
      "https://dev-mercury.fortress-asya.com:17019/api/public/v1/vendor/";

  try {
    // Make the GET request
    final response = await http.get(Uri.parse(apiUrl));

    // Check the response status
    if (response.statusCode == 200) {
      // Decode the JSON response and parse into the DescriptionVendors model
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // print(jsonDecode(response.body));
      return DescriptionVendors.fromJson(jsonResponse);
    } else {
      print("Error: HTTP ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("An error occurred: $e");
    return null;
  }
}
