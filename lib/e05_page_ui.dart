import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'e06_page_ui.dart';
import 'widgets/common_widgets.dart';

/// E05 - OTP verification page.
class E05PageUI extends StatefulWidget {
  const E05PageUI({super.key});

  @override
  State<E05PageUI> createState() => _E05PageUIState();
}

class _E05PageUIState extends State<E05PageUI> {
  static const _otpLength = 4;
  static const _resendSeconds = 30;

  final _controllers =
      List.generate(_otpLength, (_) => TextEditingController());
  final _focusNodes = List.generate(_otpLength, (_) => FocusNode());

  Timer? _timer;
  int _secondsLeft = _resendSeconds;

  bool get _isComplete => _controllers.every((c) => c.text.isNotEmpty);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) timer.cancel();
      setState(() => _secondsLeft--);
    });
  }

  void _resendCode() {
    for (final c in _controllers) {
      c.clear();
    }
    setState(() => _secondsLeft = _resendSeconds);
    _startTimer();
    _focusNodes.first.requestFocus();
    showDemoSnackBar(context, 'A new code has been sent to your email');
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    if (_isComplete) FocusScope.of(context).unfocus();
    setState(() {});
  }

  void _verify() {
    if (!_isComplete) {
      showDemoSnackBar(context, 'Please enter the 4 digit code');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const E06PageUI()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 48,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        tooltip: 'Back',
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryLight,
                        ),
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Image.asset(AppImages.orange3, height: 300),
                    const SizedBox(height: 24),
                    const Text('Enter OTP', style: AppTextStyles.title),
                    const SizedBox(height: 4),
                    const Text(
                      'An 4 digit code has been sent to your email',
                      style: AppTextStyles.caption,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(_otpLength, (i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SizedBox(
                            width: 56,
                            child: TextField(
                              controller: _controllers[i],
                              focusNode: _focusNodes[i],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                fillColor: AppColors.otpFill,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (v) => _onDigitChanged(i, v),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    if (_secondsLeft > 0)
                      Text.rich(
                        TextSpan(
                          text: 'You should receive the OTP in ',
                          children: [
                            TextSpan(
                              text: '$_secondsLeft seconds',
                              style: AppTextStyles.link,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption,
                      )
                    else
                      LinkText(
                        message: "Didn't receive the code?",
                        action: 'Resend code',
                        onPressed: _resendCode,
                      ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _verify,
                      child: const Text('Verify'),
                    ),
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
