import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_workshop_ui_project/app_theme.dart';
import 'package:flutter_workshop_ui_project/e01_page_ui.dart';
import 'package:flutter_workshop_ui_project/e02_page_ui.dart';
import 'package:flutter_workshop_ui_project/e03_page_ui.dart';
import 'package:flutter_workshop_ui_project/e04_page_ui.dart';
import 'package:flutter_workshop_ui_project/e05_page_ui.dart';
import 'package:flutter_workshop_ui_project/e06_page_ui.dart';
import 'package:flutter_workshop_ui_project/main.dart';

/// iPhone 15 Pro Max: 1290 x 2796 px @3x = 430 x 932 logical pixels.
void useIPhone15ProMax(WidgetTester tester) {
  tester.view.physicalSize = const Size(1290, 2796);
  tester.view.devicePixelRatio = 3.0;
  addTearDown(tester.view.reset);
}

void main() {
  final pages = <String, Widget>{
    'E01PageUI': const E01PageUI(),
    'E02PageUI': const E02PageUI(),
    'E03PageUI': const E03PageUI(),
    'E04PageUI': const E04PageUI(),
    'E05PageUI': const E05PageUI(),
    'E06PageUI': const E06PageUI(),
  };

  pages.forEach((name, page) {
    testWidgets('$name renders on iPhone 15 Pro Max without overflow',
        (tester) async {
      useIPhone15ProMax(tester);
      await tester.pumpWidget(MaterialApp(theme: AppTheme.light, home: page));
      await tester.pump();
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  });

  testWidgets('App starts on E01 and Explore Now opens E02', (tester) async {
    useIPhone15ProMax(tester);
    await tester.pumpWidget(const OrangeApp());
    expect(find.byType(E01PageUI), findsOneWidget);

    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();
    expect(find.byType(E02PageUI), findsOneWidget);
  });
}
