import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  testWidgets('rebuilds sections when the local projection changes', (
    tester,
  ) async {
    final notifier = ValueNotifier<WatchProgressSurfaceCollection>(
      WatchProgressSurfaceCollection(const []),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WatchProgressSectionsBuilder(
            collectionListenable: notifier,
          ),
        ),
      ),
    );

    expect(find.text('Nothing to continue'), findsOneWidget);
    expect(find.text('No history yet'), findsOneWidget);

    notifier.value = WatchProgressSurfaceCollection([
      WatchProgressSurfaceItem(
        contentId: 'runtime-title',
        position: const Duration(minutes: 5),
        duration: const Duration(minutes: 20),
        updatedAt: DateTime(2026, 9, 24, 8),
        seasonNumber: 1,
        episodeNumber: 2,
      ),
    ]);
    await tester.pump();

    expect(find.text('runtime-title'), findsNWidgets(2));
    expect(find.text('S1 E2 • 25%'), findsNWidgets(2));

    notifier.dispose();
  });
}
