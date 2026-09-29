import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widget/Image_field.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_drop_down.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_text_from_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddViewBody extends StatefulWidget {
  const AddViewBody({super.key});

  @override
  State<AddViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddViewBody> {
  GlobalKey<FormState> fromKey = GlobalKey();
  String? selectedCategory;

  late String name, desc, code;
  late num price;
  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    name = value!.toLowerCase();
                  },
                  hintText: 'Product Name',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'Product Price',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    desc = value!.toLowerCase();
                  },
                  hintText: 'Product Description',
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomDropDown<String>(
                  hintText: 'Select Category',
                  onSaved: (newValue) {
                    selectedCategory = newValue!;
                  },
                  value: selectedCategory,
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ImageField(
                  onChanged: (value) {
                    if (value != null) {
                      image = value;
                    }
                  },
                ),
                SizedBox(height: 24),
                CustomButton(
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      fromKey.currentState!.save();
                      if (image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a product image'),
                          ),
                        );
                        return;
                      }
                      AddProductInputEntities(
                        name: name,
                        desc: desc,
                        code: code,
                        image: image!,
                        price: price,
                        categoryId: selectedCategory!,
                      );
                    }
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyles.semiBold16.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> categories = ['Fruits', 'Vegetables', 'Beverages', 'Meat'];
}
