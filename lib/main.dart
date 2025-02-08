import 'package:flutter/material.dart';
import 'package:yumfac_task/screens/addProductPage.dart';
import 'package:yumfac_task/screens/deliveryDetailsPage.dart';
import 'package:yumfac_task/screens/home.dart';
import 'package:yumfac_task/screens/productDetails.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> main() async {
  await dotenv.load(fileName: '/Users/admin/Harshan/Flutter/yumfac_task/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String licenseNo = '12345678901234';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  HomeScreen(), 
        '/productDetails': (context) => Productdetails(licenseNo: licenseNo,),
        '/addproduct':(context)=> AddProductPage(),
        '/delivery':(context)=>Deliverydetailspage()
      },
    );
  }
}