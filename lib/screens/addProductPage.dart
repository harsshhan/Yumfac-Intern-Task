
import 'package:flutter/material.dart';

import 'package:yumfac_task/constans.dart';

import '../services/addProduct_service.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool inStockStatus = false;
  bool canUploadImages = false;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _servingInfoController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String? selectedFoodType;

  final String licenseNo ='12345678901234';



  final List<String> foodTypes = [
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
    'Beverages',
    'Desserts'
  ];

  

  Future<void> _saveProduct() async {

    if (_productNameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        selectedFoodType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill in all required fields')),
      );
      return;
    }



    try {
      final service = AddProductService();
      final response = await service.addProduct(
        inStockStatus: inStockStatus,
        allowCustomerImages: canUploadImages,
        foodPreference: selectedFoodType!,
        productName: _productNameController.text,
        description: _descriptionController.text,
        servingInformation: _servingInfoController.text,
        note: _noteController.text, 
        licenseNo: licenseNo,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Product added successfully')),
      );


      _clearForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _clearForm() {
    setState(() {
      _productNameController.clear();
      _descriptionController.clear();
      _servingInfoController.clear();
      _noteController.clear();
      selectedFoodType = null;
      inStockStatus = false;
      canUploadImages = false;
    });
  }


  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _servingInfoController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    int? maxLines,
    int? maxLength,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildEditListButton(String title) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ADD PRODUCT',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEB4E3D),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Copy',
                    style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                _saveProduct();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'In Stock Status',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: inStockStatus,
                    onChanged: (value) {
                      setState(() {
                        inStockStatus = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.redColor,
                    
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upload Product Images:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: canUploadImages,
                    onChanged: (value) {
                      setState(() {
                        canUploadImages = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.redColor,
                  ),
                ],
              ),
              const Text(
                'Customers can add up to 2 product images for customisation!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              RichText(
                text: const TextSpan(
                  text: 'Food Preference',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedFoodType,
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Select Food Type'),
                    ),
                    isExpanded: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    items: foodTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedFoodType = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),

              RichText(
                text: const TextSpan(
                  text: 'Product Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Enter Product Name',
                controller: _productNameController,
              ),
              const SizedBox(height: 15),

              RichText(
                text: const TextSpan(
                  text: 'Description',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Write Product Description!',
                controller: _descriptionController,
                maxLines: 4,
                maxLength: 500,
              ),
              const SizedBox(height: 15),

              const Text(
                'Serving Information:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                hintText: 'Write Serving Information!',
                controller: _servingInfoController,
                maxLines: 4,
                maxLength: 500,
              ),

              const Text(
                'Note:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: 'Write Note!',
                controller: _noteController,
                maxLines: 4,
                maxLength: 500,
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  const Text(
                    'Flavour, Size & Price Chart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                },
                child: _buildEditListButton('Edit List'),
              ),
              const SizedBox(height: 24),

              const Text(
                'Customizations:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {

                },
                child: _buildEditListButton('Edit List'),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  const Text(
                    'Add Product Image (Max 1)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
              onTap: () {
              },
              customBorder: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), 
              ),
              child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:  AppColors.redColor),
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

              
            ],
          ),
        ),
      ),
    );
  }
}