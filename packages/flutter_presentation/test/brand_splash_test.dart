import 'package:flutter/material.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('brand mark exposes a single accessible identity', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FourBaBrandMark())),
    );

    expect(find.bySemanticsLabel('4BA'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('splash is local and honors reduced motion', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FourBaCinematicSplash(reduceMotion: true, progress: 1),
      ),
    );

    final opacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );
    expect(opacity.duration, Duration.zero);
    expect(find.text('4BA'), findsOneWidget);
    expect(find.byType(FourBaBrandMark), findsOneWidget);
  });

  testWidgets('splash clamps animation progress', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: FourBaCinematicSplash(progress: 2)),
    );

    final opacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );
    expect(opacity.opacity, 1);
  });
}
