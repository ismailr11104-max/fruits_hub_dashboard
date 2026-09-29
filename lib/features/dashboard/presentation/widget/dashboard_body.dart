import 'package:flutter/cupertino.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widget/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/add_product_view.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AddProductView.addView);
      },
      child: Text(
        'Add Product',
        style: TextStyles.bold19.copyWith(color: Color(0xffffffff)),
      ),
    );
  }
}
