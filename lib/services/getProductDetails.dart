import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchProductDetails(String licenseNo) async {
  final baseUrl = dotenv.env['BASE_URL'];
  final response = await http.get(Uri.parse('$baseUrl/api/product/$licenseNo'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);

    // Ensure the response is a List and cast it properly
    return jsonResponse.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load product details');
  }
}