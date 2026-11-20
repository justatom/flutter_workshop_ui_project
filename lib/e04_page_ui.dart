import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'e03_page_ui.dart';
import 'e05_page_ui.dart';
import 'widgets/common_widgets.dart';

/// E04 - Forgot password page.
class E04PageUI extends StatelessWidget {
  const E04PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderImage(heightFactor: 0.40),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Forgot your password?',
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Enter email address',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'E-mail'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const E05PageUI()),
                    ),
                    child: const Text('Send code'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: LinkText(
            message: "Don't have an account?",
            action: 'Create account',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const E03PageUI()),
            ),
          ),
        ),
      ),
    );
  }
}
