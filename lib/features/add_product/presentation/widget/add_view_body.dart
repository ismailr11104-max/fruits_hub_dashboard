import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widget/Image_field.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_drop_down.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_text_from_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entities.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/controller/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widget/is_organic_check_box.dart';

class AddViewBody extends StatefulWidget {
  const AddViewBody({super.key});

  @override
  State<AddViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddViewBody> {
  GlobalKey<FormState> fromKey = GlobalKey();
  String? selectedCategory;

  late String name, desc, code;
  late num price, expirationsMonths, numberOfCalories, unitAmount;
  File? image;
  bool isOrganic = false;

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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    price = num.tryParse(value!.trim())!;
                  },
                  hintText: 'Product Price',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter product price';
                    }
                    final parsedPrice = num.tryParse(value.trim());
                    if (parsedPrice == null) {
                      return 'Please enter a valid price';
                    }
                    if (parsedPrice <= 0) {
                      return 'Price must be greater than 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter product code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    desc = value!.toLowerCase();
                  },
                  hintText: 'Product Description',
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter product description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    expirationsMonths = int.tryParse(value!.trim())!;
                  },
                  hintText: 'Expirations Months',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter expirations months';
                    }
                    final parsedValue = int.tryParse(value.trim());
                    if (parsedValue == null) {
                      return 'Please enter a valid number';
                    }
                    if (parsedValue <= 0) {
                      return 'Value must be greater than 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    numberOfCalories = int.tryParse(value!.trim())!;
                  },
                  hintText: 'Number of Calories',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter number of calories';
                    }
                    final parsedValue = int.tryParse(value.trim());
                    if (parsedValue == null) {
                      return 'Please enter a valid number';
                    }
                    if (parsedValue <= 0) {
                      return 'Value must be greater than 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFromField(
                  onSaved: (value) {
                    unitAmount = int.tryParse(value!.trim())!;
                  },
                  hintText: 'Unit Amount',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter unit amount';
                    }
                    final parsedValue = int.tryParse(value.trim());
                    if (parsedValue == null) {
                      return 'Please enter a valid number';
                    }
                    if (parsedValue <= 0) {
                      return 'Value must be greater than 0';
                    }
                    return null;
                  },
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
                IsOrganciCheckBox(
                  onChanged: (value) {
                    isOrganic = value;
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
                BlocConsumer<AddProductCubit, AddProductState>(
                  listener: (context, state) {
                    if (state is AddProductSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Success add Product'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }

                    if (state is AddProductFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failure add Product'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        final isValid = fromKey.currentState!.validate();

                        if (isValid) {
                          fromKey.currentState!.save();

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a product image'),
                              ),
                            );
                            return;
                          }

                          final input = AddProductInputEntities(
                            name: name,
                            desc: desc,
                            code: code,
                            image: image!,
                            price: price,
                            categoryId: selectedCategory!,
                            expirationsMonths: expirationsMonths.toInt(),
                            numberOfCalories: numberOfCalories.toInt(),
                            unitAmount: unitAmount.toInt(),
                            isOrganic: isOrganic,
                            reviews: [
                              ReviewEntities(
                                name: 'name',
                                image: 'image',
                                rating: 2,
                                data: DateTime.now().toIso8601String(),
                                comment: 'comment',
                              ),
                            ],
                          );

                          context.read<AddProductCubit>().addProduct(input);
                        }
                      },
                      child: Text(
                        'Add Product',
                        style: TextStyles.semiBold16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
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
