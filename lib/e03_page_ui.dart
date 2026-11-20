import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'widgets/common_widgets.dart';

/// E03 - Register page.
class E03PageUI extends StatelessWidget {
  const E03PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderImage(heightFactor: 0.22),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Create your new account',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 24),
                  const TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'E-mail'),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Phone'),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  const Text.rich(
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: AppTextStyles.link,
                        ),
                        TextSpan(text: '\nand '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.link,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDemoSnackBar(context, 'Sign up successful');
                      goToLogin(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 8),
                  const SocialLoginRow(),
                  const SizedBox(height: 8),
                  LinkText(
                    message: 'Already have an account?',
                    action: 'Log in',
                    onPressed: () => goToLogin(context),
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
