import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/services/service_locato/git_it.dart';
import 'package:fruits_hub_dashboard/core/widget/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/controller/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widget/add_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const addView = 'add_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Add Product'),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(sl<AddProductRepo>(), sl<ImageRepo>()),
        child: AddViewBody(),
      ),
    );
  }
}
