import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'theme/app_theme.dart';
import 'pages/login_page.dart';
import 'utils/data_seeder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize locale data for Indonesian
  await initializeDateFormatting('id_ID', null);
  Intl.defaultLocale = 'id_ID';
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Seed sample data on first run (optional - comment out if not needed)
  await _initializeSampleData();
  
  runApp(const MyApp());
}

/// Initialize sample data on first run
Future<void> _initializeSampleData() async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstRun = prefs.getBool('is_first_run') ?? true;
  
  if (isFirstRun) {
    final seeder = DataSeeder();
    await seeder.seedSampleData();
    await prefs.setBool('is_first_run', false);
    print('🎉 First run: Sample data initialized!');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uangku',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
