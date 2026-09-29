import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardScreen.dashboardView:
      return MaterialPageRoute(builder: (context) => const DashboardScreen());

    case AddProductView.addView:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
