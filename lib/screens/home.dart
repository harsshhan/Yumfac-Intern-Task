import 'package:flutter/material.dart';
import 'package:yumfac_task/constans.dart';
import 'package:yumfac_task/services/shop_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String shopName = '';
  String license_no = '';
  String? image_url;
  bool isLoading = true;

  final String licenseNumber = "12345678901234";

  @override
  void initState() {
    super.initState();
    fetchShopData();
  }

  Future<void> fetchShopData() async {
    final shopData = await ShopDetails().getShop(licenseNumber);
    if (shopData != null) {
      setState(() {
        shopName = shopData['name'] ?? "Unknown Shop";
        license_no = shopData['fssai_license_no'] ?? "Unknown License";
        image_url = shopData['image_url'];
        isLoading = false;
      });
    } else {
      setState(() {
        shopName = "Error fetching data";
        license_no = "Error fetching data";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MANAGE SHOP",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop Name: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 5,
            ),
            Text(shopName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(98, 98, 98, 1))),
            SizedBox(
              height: 10,
            ),
            Text("FSSAI License Number: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 5,
            ),
            Text(license_no,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(98, 98, 98, 1))),
            SizedBox(
              height: 10,
            ),
            Text("Add Shop Display Photo (Max 1)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("add image");
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.redColor),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Add Image",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                buildSettingsOption("Offer & Discount", () {}),
                buildSettingsOption("Other Settings", () {}),
                buildSettingsOption("Packaging & Delivery", () {
                  Navigator.pushNamed(
                    context,
                    '/delivery',
                  );
                }),
                buildSettingsOption("Products", () {
                  Navigator.pushNamed(
                    context,
                    '/productDetails',
                  );
                }),
                buildSettingsOption("Promotions", () {}),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Note: "),
            SizedBox(
              height: 15,
            ),
            Text(
              "1. Shop will not be visible to customers if you have no products added!",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2. Add products at menu price to avoid items being delisted in the future!",
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSettingsOption(String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Material(
      elevation: 2,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
