import 'package:flutter/material.dart';
import 'package:yumfac_task/services/delivery_service.dart';

class Deliverydetailspage extends StatefulWidget {
  const Deliverydetailspage({super.key});

  @override
  State<Deliverydetailspage> createState() => _DeliverydetailspageState();
}

class _DeliverydetailspageState extends State<Deliverydetailspage> {
  
  final TextEditingController _deliveryTimeController = TextEditingController();
  final TextEditingController _deliveryRadiusController = TextEditingController();
  final TextEditingController _freeDeliveryRadiusController = TextEditingController();
  final TextEditingController _orderValueGreater500Controller = TextEditingController();
  final TextEditingController _orderValueLess500Controller = TextEditingController();
  
  bool _isLoading = false;
  final String licenseNo ='12345678901234';

  @override
  void dispose() {
    _deliveryTimeController.dispose();
    _deliveryRadiusController.dispose();
    _freeDeliveryRadiusController.dispose();
    _orderValueGreater500Controller.dispose();
    _orderValueLess500Controller.dispose();
    super.dispose();
  }


Future<void> _saveDeliveryDetails() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final deliveryService = DeliveryService();
      await deliveryService.addDeliveryData(
        licenseNo,
        int.parse(_deliveryTimeController.text),
        double.parse(_deliveryRadiusController.text),
        double.parse(_freeDeliveryRadiusController.text),
        double.parse(_orderValueGreater500Controller.text),
        double.parse(_orderValueLess500Controller.text),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Delivery details saved successfully')),
      );

      _deliveryRadiusController.clear();
      _deliveryTimeController.clear();
      _freeDeliveryRadiusController.clear();
      _orderValueGreater500Controller.clear();
      _orderValueGreater500Controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  Widget _buildInputField(TextEditingController controller, String hint) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: const Color.fromRGBO(0, 0, 0, 0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 2),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(98, 98, 98, 1),
            ),
          ),
        ),
      ),
    );
  }
  
  
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
                  child: _buildInputField(_deliveryTimeController, "Enter Value"),
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
                  child: _buildInputField(_deliveryRadiusController, "Enter Value"),
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
                  child: _buildInputField(_freeDeliveryRadiusController, "Enter Value"),
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
                  child: _buildInputField(_orderValueGreater500Controller, "Enter Price in ₹"),
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
                  child: _buildInputField(_orderValueLess500Controller, "Enter Price in ₹"),
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
                onTap: _isLoading ? null : _saveDeliveryDetails,
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
                      child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
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
