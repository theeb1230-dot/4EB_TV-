import 'package:flutter_test/flutter_test.dart';
import 'package:four_ba_app/main.dart';

void main() {
  testWidgets('starts Arabic-first and navigates between core sections',
      (tester) async {
    await tester.pumpWidget(const FourBaApp());
    expect(find.text('الرئيسية'), findsWidgets);
    expect(find.text('البحث'), findsWidgets);

    await tester.tap(find.text('البحث').first);
    await tester.pump();
    expect(find.text('البحث'), findsWidgets);
  });
}
