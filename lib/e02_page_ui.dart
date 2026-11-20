import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'e03_page_ui.dart';
import 'e04_page_ui.dart';
import 'widgets/common_widgets.dart';

/// E02 - Login page.
class E02PageUI extends StatefulWidget {
  const E02PageUI({super.key});

  @override
  State<E02PageUI> createState() => _E02PageUIState();
}

class _E02PageUIState extends State<E02PageUI> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderImage(heightFactor: 0.30),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Login to your account',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 28),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Enter email or phone',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword
                            ? 'Show password'
                            : 'Hide password',
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const E04PageUI()),
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: AppTextStyles.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => showDemoSnackBar(context, 'Log in'),
                    child: const Text('Log in'),
                  ),
                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 8),
                  const SocialLoginRow(),
                  const SizedBox(height: 8),
                  LinkText(
                    message: "Don't have an account?",
                    action: 'Create account',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const E03PageUI()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
