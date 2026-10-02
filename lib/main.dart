import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/services/service_locato/git_it.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASEURL']!,
    publishableKey: dotenv.env['SUPABASEKEY']!,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardScreen.dashboardView,
    );
  }
}
