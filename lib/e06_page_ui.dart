import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'widgets/common_widgets.dart';

/// E06 - Create new password page.
class E06PageUI extends StatefulWidget {
  const E06PageUI({super.key});

  @override
  State<E06PageUI> createState() => _E06PageUIState();
}

class _E06PageUIState extends State<E06PageUI> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    final password = _passwordController.text;
    if (password.isEmpty) {
      showDemoSnackBar(context, 'Please enter a new password');
      return;
    }
    if (password != _confirmController.text) {
      showDemoSnackBar(context, 'Passwords do not match');
      return;
    }
    showDemoSnackBar(context, 'Your password has been changed');
    goToLogin(context);
  }

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
                    'Create New Password',
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Enter new password',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Enter new password',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _confirmController,
                    obscureText: true,
                    onSubmitted: (_) => _submit(),
                    decoration: const InputDecoration(
                      hintText: 'Confirm password',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Submit'),
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
