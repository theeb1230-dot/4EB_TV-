import 'package:presentation_contract/presentation_contract.dart';
import 'package:test/test.dart';

void main() {
  test('projects history metadata without provider or storage fields', () {
    const item = WatchProgressSurfaceItem(
      contentId: 'show-1',
      position: Duration(minutes: 12),
      duration: Duration(minutes: 48),
      updatedAt: DateTime.utc(2026, 9, 23, 10),
      seasonNumber: 2,
      episodeNumber: 4,
    );

    expect(item.contentId, 'show-1');
    expect(item.seasonNumber, 2);
    expect(item.episodeNumber, 4);
    expect(item.progressFraction, closeTo(0.25, 0.0001));
    expect(item.isCompleted, isFalse);
  });

  test('clamps progress fraction to a UI-safe range', () {
    const item = WatchProgressSurfaceItem(
      contentId: 'show-2',
      position: Duration(minutes: 60),
      duration: Duration(minutes: 48),
      updatedAt: DateTime.utc(2026, 9, 23),
    );

    expect(item.progressFraction, 1.0);
    expect(item.isCompleted, isTrue);
  });
}
