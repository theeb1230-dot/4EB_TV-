import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  testWidgets('Arabic shell renders RTL with mobile navigation',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicShell(
          contextModel: FourBaPresentationContext(
            logicalWidth: 390,
            isTenFoot: false,
          ),
          child: Text('المحتوى'),
        ),
      ),
    );
    expect(Directionality.of(tester.element(find.text('المحتوى'))),
        TextDirection.rtl);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('TV shell uses sidebar and exposes focus highlight',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicShell(
          contextModel: FourBaPresentationContext(
            logicalWidth: 1920,
            isTenFoot: true,
          ),
          child: Text('المحتوى'),
        ),
      ),
    );
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byType(FourBaFocusTile), findsWidgets);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(FocusManager.instance.primaryFocus, isNotNull);
  });

  testWidgets('accessibility preferences reach MediaQuery', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicShell(
          contextModel: FourBaPresentationContext(
            logicalWidth: 800,
            isTenFoot: false,
            locale: FourBaLocale.en,
            reduceMotion: true,
            highContrast: true,
            textScale: 1.4,
          ),
          child: Text('Content'),
        ),
      ),
    );
    final data = MediaQuery.of(tester.element(find.text('Content')));
    expect(data.disableAnimations, isTrue);
    expect(data.highContrast, isTrue);
    expect(data.textScaler.scale(10), 14);
    expect(Directionality.of(tester.element(find.text('Content'))),
        TextDirection.ltr);
  });

  testWidgets('cinematic button honors TV target and keyboard focus',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FourBaCinematicShell(
          contextModel: const FourBaPresentationContext(
            logicalWidth: 1920,
            isTenFoot: true,
            reduceMotion: true,
          ),
          child: FourBaCinematicButton(
            label: 'تشغيل',
            isTenFoot: true,
            autofocus: true,
            onPressed: () {},
          ),
        ),
      ),
    );
    await tester.pump();
    final size = tester.getSize(find.byType(FourBaCinematicButton));
    expect(size.height, greaterThanOrEqualTo(56));
    expect(FocusManager.instance.primaryFocus, isNotNull);
  });

  testWidgets(
      'runtime theme consumes Cinematic Gold typography and focus tokens',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicShell(
          contextModel: FourBaPresentationContext(
            logicalWidth: 390,
            isTenFoot: false,
          ),
          child: Text('عنوان', style: TextStyle()),
        ),
      ),
    );
    final context = tester.element(find.text('عنوان'));
    final theme = Theme.of(context);
    expect(theme.brightness, Brightness.dark);
    expect(theme.textTheme.headlineMedium?.fontSize, 28);
    expect(theme.textTheme.bodyLarge?.fontSize, 16);
    expect(theme.inputDecorationTheme.filled, isTrue);
    expect(theme.primaryTextTheme.headlineMedium?.fontSize, 28);
    expect(theme.splashFactory, isA<InkSparkleFactory>());
  });
  testWidgets('reduced motion disables splash feedback', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicShell(
          contextModel: FourBaPresentationContext(
            logicalWidth: 390,
            isTenFoot: false,
            reduceMotion: true,
          ),
          child: Text('هادئ'),
        ),
      ),
    );
    final theme = Theme.of(tester.element(find.text('هادئ')));
    expect(theme.splashFactory, isA<NoSplashFactory>());
  });

}
