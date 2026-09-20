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

  test('local cache expiry is deterministic and backend independent', () {
    final storedAt = DateTime.utc(2026, 9, 20, 1);
    final value = CachedValue(
      value: 'cached-metadata',
      storedAt: storedAt,
      expiresAt: storedAt.add(const Duration(hours: 1)),
    );

    expect(value.isExpiredAt(storedAt), isFalse);
    expect(
      value.isExpiredAt(storedAt.add(const Duration(minutes: 59))),
      isFalse,
    );
    expect(value.isExpiredAt(storedAt.add(const Duration(hours: 1))), isTrue);
  });

  test('local diagnostics carry no mandatory identity field', () {
    final event = LocalDiagnosticEvent(
      code: 'cache.expired',
      occurredAt: DateTime.utc(2026, 9, 20),
      attributes: const {'scope': 'metadata'},
    );

    expect(event.code, 'cache.expired');
    expect(event.attributes, const {'scope': 'metadata'});
  });
}
