import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/widget/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const dashboardView = 'dashboard_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [DashboardBody()],
        ),
      ),
    );
  }
}
