import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
class DeliveryService {
  final  baseUrl = dotenv.env['BASE_URL'];

  Future<void> addDeliveryData(
    String licenseNo,
    int deliveryTime,
    double deliveryRadius,
    double freeDeliveryRadius,
    double orderValueGreaterOrEqual500,
    double orderValueLess500,
  ) async {
    final url = Uri.parse('$baseUrl/api/delivery/$licenseNo');
    
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'deliveryTime': deliveryTime,
          'deliveryRadius': deliveryRadius,
          'freeDeliveryRadius': freeDeliveryRadius,
          'orderValueGreaterOrEqual500': orderValueGreaterOrEqual500,
          'orderValueLess500': orderValueLess500,
        }),
      );

      if (response.statusCode != 200) {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to save delivery details');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}