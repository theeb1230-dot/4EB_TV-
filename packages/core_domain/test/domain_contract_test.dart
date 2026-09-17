import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('stream support does not imply download support', () {
    const descriptor = ProviderDescriptor(
      providerId: 'diagnostic-only',
      version: '1',
      capabilities: {Capability.stream},
      configurationSchemaVersion: 1,
    );

    expect(descriptor.supports(Capability.stream), isTrue);
    expect(descriptor.supports(Capability.download), isFalse);
  });

  test('playback checkpoint is provider independent', () {
    final checkpoint = PlaybackCheckpoint(
      canonicalContentId: 'content:1',
      position: const Duration(seconds: 42),
      duration: const Duration(minutes: 10),
      updatedAt: DateTime.utc(2026),
      completed: false,
      season: 1,
      episode: 2,
    );

    expect(checkpoint.canonicalContentId, 'content:1');
    expect(checkpoint.position, const Duration(seconds: 42));
  });
}
