import 'package:core_domain/core_domain.dart';
import 'package:local_data_codec/local_data_codec.dart';
import 'package:test/test.dart';

void main() {
  const codec = LocalDataCodec();

  test('cached values round-trip with UTC timestamps', () {
    final original = CachedValue(
      value: 'episode-42',
      storedAt: DateTime.parse('2026-09-20T10:00:00+03:00'),
      expiresAt: DateTime.parse('2026-09-20T11:00:00+03:00'),
    );

    final decoded = codec.decodeCachedValue(codec.encodeCachedValue(original));

    expect(decoded.value, original.value);
    expect(decoded.storedAt, original.storedAt.toUtc());
    expect(decoded.expiresAt, original.expiresAt?.toUtc());
  });

  test('diagnostics round-trip without adding identity fields', () {
    final original = LocalDiagnosticEvent(
      code: 'player.retry',
      occurredAt: DateTime.utc(2026, 9, 20, 7),
      attributes: const {'reason': 'timeout'},
    );

    final encoded = codec.encodeDiagnostic(original);
    final decoded = codec.decodeDiagnostic(encoded);

    expect(encoded.contains('userId'), isFalse);
    expect(encoded.contains('deviceId'), isFalse);
    expect(decoded.code, original.code);
    expect(decoded.occurredAt, original.occurredAt);
    expect(decoded.attributes, original.attributes);
  });

  test('invalid persisted cache data fails closed', () {
    expect(
      () => codec.decodeCachedValue('{"value":7,"storedAt":"bad"}'),
      throwsFormatException,
    );
  });

  test('invalid diagnostic attribute values fail closed', () {
    expect(
      () => codec.decodeDiagnostic(
        '{"code":"x","occurredAt":"2026-09-20T07:00:00Z","attributes":{"n":1}}',
      ),
      throwsFormatException,
    );
  });
}
