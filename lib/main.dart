import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'e01_page_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const OrangeApp());
}

class OrangeApp extends StatelessWidget {
  const OrangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange ส้ม',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const E01PageUI(),
    );
  }
}
