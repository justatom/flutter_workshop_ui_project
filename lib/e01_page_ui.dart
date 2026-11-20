import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'e02_page_ui.dart';

/// E01 - Welcome page (first page of the app).
class E01PageUI extends StatelessWidget {
  const E01PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(AppImages.orange1, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'BERRY JUICE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'A Moments of healthy sip\nThe best vitamin for your health',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const E02PageUI()),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Explore Now'),
                    Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
