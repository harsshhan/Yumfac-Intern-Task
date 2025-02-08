import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class ShopDetails{
  final  baseUrl = dotenv.env['BASE_URL'];

  Future<Map<String, dynamic>?> getShop(String licenseNo) async {
  final Uri url = Uri.parse('$baseUrl/api/shop?license_no=$licenseNo');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data is List && data.isNotEmpty) {
        return data[0]; 
      } else {
        print("Unexpected response format: $data");
        return null;
      }
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}

  Future<String?> uploadShopImage(String licenseNo, File imageFile) async {
    try {
      final Uri url = Uri.parse("$baseUrl/api/shop/image/$licenseNo");
      final request = http.MultipartRequest("POST", url)
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        return decodedResponse["image_url"];
      } else {
        print("Error uploading image: ${decodedResponse['error']}");
        return null;
      }
    } catch (e) {
      print("Exception in uploadShopImage: $e");
      return null;
    }
  }
}
