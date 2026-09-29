import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widget/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widget/add_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const addView = 'add_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Add Product'),
      body: AddViewBody(),
    );
  }
}
