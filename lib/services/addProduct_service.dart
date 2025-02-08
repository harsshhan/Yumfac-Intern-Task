import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddProductService {
  final  baseUrl = dotenv.env['BASE_URL']; 

  Future<Map<String, dynamic>> addProduct({
    required String licenseNo,
    required bool inStockStatus,
    required bool allowCustomerImages,
    required String foodPreference,
    required String productName,
    required String description,
    required String servingInformation,
    required String note,
  }) async {
    try {
      var uri = Uri.parse('$baseUrl/api/product/$licenseNo');
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'inStockStatus': inStockStatus.toString(),
        'allowCustomerImages': allowCustomerImages.toString(),
        'foodPreference': foodPreference,
        'productName': productName,
        'description': description,
        'servingInformation': servingInformation,
        'note': note,
        })
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw HttpException('Failed to add product: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error adding product: $e');
    }
  }
}


// class ProductModel {
//   final String productName;
//   final String description;
//   final String foodPreference;
//   final bool inStockStatus;
//   final bool allowCustomerImages;
//   final String servingInformation;
//   final String note;

//   ProductModel({
//     required this.productName,
//     required this.description,
//     required this.foodPreference,
//     required this.inStockStatus,
//     required this.allowCustomerImages,
//     required this.servingInformation,
//     required this.note,
//   });

//   Map<String, dynamic> toJson() => {
//         'productName': productName,
//         'description': description,
//         'foodPreference': foodPreference,
//         'inStockStatus': inStockStatus,
//         'allowCustomerImages': allowCustomerImages,
//         'servingInformation': servingInformation,
//         'note': note,
//       };
// }