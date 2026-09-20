import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_ba_app/main.dart';

void main() {
  testWidgets('navigates home to search, details and episodes', (tester) async {
    await tester.pumpWidget(const FourBaApp());

    expect(find.text('البحث'), findsOneWidget);
    await tester.tap(find.text('البحث'));
    await tester.pump();
    expect(find.text('ابحث عن فيلم أو مسلسل'), findsOneWidget);

    await tester.enterText(find.byType(EditableText), 'تجريبي');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.text('محتوى تجريبي محلي'));
    await tester.pump();
    expect(find.text('الحلقات'), findsOneWidget);

    await tester.tap(find.text('الحلقات'));
    await tester.pump();
    expect(find.text('الحلقة 1'), findsOneWidget);
  });
}
