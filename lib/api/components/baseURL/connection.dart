import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_digipayweb/api/components/models/model.dart';

class DashboardValuesAPI {
  static const String baseUrl =
      'https://dev-api-janus.fortress-asya.com:18031/api/public/v1/graph';

  Future<List<Transaction>> fetchTransactions() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Parse the JSON
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
