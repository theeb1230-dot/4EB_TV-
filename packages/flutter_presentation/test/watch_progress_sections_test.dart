import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  testWidgets('renders deterministic sections and forwards item taps', (
    tester,
  ) async {
    final completed = WatchProgressSurfaceItem(
      contentId: 'completed-title',
      position: const Duration(minutes: 50),
      duration: const Duration(minutes: 50),
      updatedAt: DateTime(2026, 9, 24, 6),
      seasonNumber: 1,
      episodeNumber: 1,
    );
    final inProgress = WatchProgressSurfaceItem(
      contentId: 'continue-title',
      position: const Duration(minutes: 12),
      duration: const Duration(minutes: 40),
      updatedAt: DateTime(2026, 9, 24, 7),
      seasonNumber: 2,
      episodeNumber: 3,
    );
    WatchProgressSurfaceItem? tapped;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WatchProgressSections(
            collection: WatchProgressSurfaceCollection(
              <WatchProgressSurfaceItem>[completed, inProgress],
            ),
            onItemTap: (item) => tapped = item,
          ),
        ),
      ),
    );

    expect(find.text('Continue Watching'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('continue-title'), findsOneWidget);
    expect(find.text('completed-title'), findsOneWidget);
    expect(find.text('S2 E3 • 30%'), findsOneWidget);
    expect(find.text('S1 E1 • 100%'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('continue-title')));
    await tester.pump();

    expect(tapped?.contentId, 'continue-title');
  });

  testWidgets('renders explicit empty states independently', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WatchProgressSections(
            collection: WatchProgressSurfaceCollection(const []),
            emptyHistoryLabel: 'History empty',
            emptyContinueWatchingLabel: 'Continue empty',
          ),
        ),
      ),
    );

    expect(find.text('History empty'), findsOneWidget);
    expect(find.text('Continue empty'), findsOneWidget);
  });
}
