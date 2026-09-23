import 'package:presentation_contract/presentation_contract.dart';
import 'package:test/test.dart';

void main() {
  test(
    'history is newest first and continue watching excludes completed items',
    () {
      final older = WatchProgressSurfaceItem(
        contentId: 'older',
        position: const Duration(minutes: 2),
        duration: const Duration(minutes: 10),
        updatedAt: DateTime.utc(2026, 9, 23, 9),
      );
      final completed = WatchProgressSurfaceItem(
        contentId: 'completed',
        position: const Duration(minutes: 10),
        duration: const Duration(minutes: 10),
        updatedAt: DateTime.utc(2026, 9, 23, 11),
      );
      final newer = WatchProgressSurfaceItem(
        contentId: 'newer',
        position: const Duration(minutes: 4),
        duration: const Duration(minutes: 10),
        updatedAt: DateTime.utc(2026, 9, 23, 12),
      );

      final collection = WatchProgressSurfaceCollection([
        older,
        completed,
        newer,
      ]);

      expect(
        collection.history.map((item) => item.contentId),
        ['newer', 'completed', 'older'],
      );
      expect(
        collection.continueWatching.map((item) => item.contentId),
        ['newer', 'older'],
      );
    },
  );

  test('collection snapshots input and output', () {
    final item = WatchProgressSurfaceItem(
      contentId: 'show-1',
      position: const Duration(minutes: 1),
      duration: const Duration(minutes: 5),
      updatedAt: DateTime.utc(2026, 9, 23),
    );
    final source = <WatchProgressSurfaceItem>[item];
    final collection = WatchProgressSurfaceCollection(source);

    source.clear();

    expect(collection.history, hasLength(1));
    expect(() => collection.history.add(item), throwsUnsupportedError);
  });
}
