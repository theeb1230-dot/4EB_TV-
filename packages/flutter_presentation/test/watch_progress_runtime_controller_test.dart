import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  WatchProgressSurfaceItem item({
    required String id,
    required int minutes,
    required DateTime updatedAt,
    int? season,
    int? episode,
    int durationMinutes = 100,
  }) {
    return WatchProgressSurfaceItem(
      contentId: id,
      position: Duration(minutes: minutes),
      duration: Duration(minutes: durationMinutes),
      updatedAt: updatedAt,
      seasonNumber: season,
      episodeNumber: episode,
    );
  }

  test('upsert replaces by content id and keeps completed items out of continue', () {
    final controller = WatchProgressRuntimeController(
      initialItems: [
        item(
          id: 'movie-1',
          minutes: 100,
          durationMinutes: 100,
          updatedAt: DateTime(2026, 9, 24, 10),
        ),
      ],
    );
    addTearDown(controller.dispose);

    controller.upsert(
      item(
        id: 'movie-1',
        minutes: 25,
        updatedAt: DateTime(2026, 9, 24, 11),
        season: 1,
        episode: 2,
      ),
    );

    expect(controller.value.history, hasLength(1));
    expect(controller.value.history.single.position, const Duration(minutes: 25));
    expect(controller.value.continueWatching.single.contentId, 'movie-1');
  });

  test('remove updates the listenable projection', () {
    final controller = WatchProgressRuntimeController(
      initialItems: [
        item(
          id: 'movie-1',
          minutes: 10,
          updatedAt: DateTime(2026, 9, 24, 10),
        ),
        item(
          id: 'movie-2',
          minutes: 20,
          updatedAt: DateTime(2026, 9, 24, 11),
        ),
      ],
    );
    addTearDown(controller.dispose);

    final observed = <int>[];
    final listener = () => observed.add(controller.value.history.length);
    controller.listenable.addListener(listener);
    addTearDown(() => controller.listenable.removeListener(listener));

    controller.remove('movie-1');

    expect(observed, [1]);
    expect(controller.value.history.single.contentId, 'movie-2');
  });
}
