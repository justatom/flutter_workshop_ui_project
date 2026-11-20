import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../e02_page_ui.dart';

/// Orange header image with the curved bottom (img_orange2).
/// [heightFactor] is the fraction of the screen height it occupies.
class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key, required this.heightFactor});

  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * heightFactor,
      child: Image.asset(
        AppImages.orange2,
        fit: BoxFit.cover,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

/// ─────── OR ───────
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }
}

/// Google / Facebook / Apple sign-in icons.
class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    Widget button(String asset, String provider) => IconButton(
          tooltip: 'Continue with $provider',
          onPressed: () => showDemoSnackBar(context, 'Continue with $provider'),
          icon: Image.asset(asset, width: 26, height: 26),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button(AppImages.google, 'Google'),
        const SizedBox(width: 12),
        button(AppImages.facebook, 'Facebook'),
        const SizedBox(width: 12),
        button(AppImages.apple, 'Apple'),
      ],
    );
  }
}

/// "Don't have an account? Create account" style line.
class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.message,
    required this.action,
    required this.onPressed,
  });

  final String message;
  final String action;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(message, style: AppTextStyles.caption),
        TextButton(
          onPressed: onPressed,
          child: Text(action, style: AppTextStyles.link),
        ),
      ],
    );
  }
}

void showDemoSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}

/// Goes to the login page (E02), keeping E01 underneath it.
void goToLogin(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const E02PageUI()),
    (route) => route.isFirst,
  );
}
