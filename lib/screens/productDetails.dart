import 'package:flutter/material.dart';
import 'package:yumfac_task/constans.dart';
import 'package:intl/intl.dart';
import '../services/getProductDetails.dart';

class Productdetails extends StatefulWidget {
  final String licenseNo;
  const Productdetails({required this.licenseNo});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  late Future<List<Map<String, dynamic>>> productDetails;
  @override
  void initState() {
    super.initState();
    productDetails = fetchProductDetails(widget.licenseNo);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "PRODUCT DETAILS",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          leading: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        body:Padding(
        padding: const EdgeInsets.all(14),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: productDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No product details available"));
            }

            final products = snapshot.data!;


            final inStockProducts = products.where((p) => p['inStockStatus'] == true).toList();
            final outOfStockProducts = products.where((p) => p['inStockStatus'] == false).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (inStockProducts.isNotEmpty) _buildProductSection("In Stock", inStockProducts),
                  if (outOfStockProducts.isNotEmpty) _buildProductSection("Out of Stock", outOfStockProducts),
                ],
              ),
            );
          },
        ),
      ),
    
      bottomNavigationBar: Container(
          padding:
              EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.redColor)),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "Add On Items",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: AppColors.redColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.redColor)),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              "Options",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: AppColors.redColor),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(
              context,
              '/addproduct',
             
            );
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Ink(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("Add Product", style:
                                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
      )
    );
  }

  Widget _buildProductSection(String title, List<Map<String, dynamic>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Column(
          children: products.map((product) => _buildProductCard(product)).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final formattedDate = DateFormat("MM/dd/yyyy").format(DateTime.parse(product['createdAt']));
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      child: ListTile(
        leading: Icon(Icons.drag_handle, color: Colors.grey.shade700),
        title: Text(
          product['productName'],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
        ),
        subtitle: Text("Added On: $formattedDate"),
        trailing: Icon(Icons.more_vert),
      ),
    );
    
  }
}
