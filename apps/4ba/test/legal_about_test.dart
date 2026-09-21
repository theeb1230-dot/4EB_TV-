import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_ba_app/legal_about.dart';

void main() {
  testWidgets(
    'TVmaze attribution and CC BY-SA are visible in-product',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: LegalAboutSurface()),
      );

      expect(find.text('حول وحقوق البيانات'), findsOneWidget);
      expect(find.text('TVmaze'), findsOneWidget);
      expect(find.text(LegalAboutSurface.tvMazeUrl), findsOneWidget);
      expect(
        find.text('Creative Commons Attribution-ShareAlike 4.0'),
        findsOneWidget,
      );
      expect(find.text(LegalAboutSurface.licenseUrl), findsOneWidget);
      expect(find.textContaining('ليس مصدر بث أو تنزيل'), findsOneWidget);
    },
  );
}
