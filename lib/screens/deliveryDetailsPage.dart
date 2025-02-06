import 'package:flutter/material.dart';

class Deliverydetailspage extends StatefulWidget {
  const Deliverydetailspage({super.key});

  @override
  State<Deliverydetailspage> createState() => _DeliverydetailspageState();
}

class _DeliverydetailspageState extends State<Deliverydetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PACKAGING & DELIVERY",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Delivery Time: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text(
                        "Enter Value",
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("Minutes",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Delivery Radius: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("Enter Value",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("KM",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Free Delivery Radius: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("Enter Value",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("KM",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Packaging & Delivery Fees: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Order Value(OV) Wise:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("OV ≥ ₹ 500",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("Enter Price in ₹",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Order Value(OV) Wise:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("OV < ₹ 500",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Center(
                      child: Text("Enter Price in ₹",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(98, 98, 98, 1))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Note: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Minimum Value Allowed: ₹ 0",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text("2. Maximum Value Allowed: ₹ 100",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  print("Save");
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 22, 22, 1),
                        
                        ),
                    height: 40,
                    width: double.infinity,
                    
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
