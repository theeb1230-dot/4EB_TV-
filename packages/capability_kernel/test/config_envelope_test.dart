import 'package:capability_kernel/capability_kernel.dart';
import 'package:test/test.dart';

final class _Verifier implements ConfigSignatureVerifier {
  const _Verifier(this.result);
  final bool result;

  @override
  bool verify(SignedConfigEnvelope envelope) => result;
}

void main() {
  const valid = SignedConfigEnvelope(
    version: 2,
    payload: '{"providers":[]}',
    signature: 'detached-signature',
    keyId: 'release-key-1',
  );

  test('requires signature verification and a strictly newer version', () {
    final guard = ConfigVersionGuard(acceptedVersion: 1);
    expect(guard.canApply(valid, const _Verifier(true)), isTrue);
    expect(guard.canApply(valid, const _Verifier(false)), isFalse);

    guard.markApplied(valid.version);
    expect(guard.canApply(valid, const _Verifier(true)), isFalse);
  });

  test('rejects incomplete envelopes before verifier trust is consulted', () {
    final guard = ConfigVersionGuard();
    const incomplete = SignedConfigEnvelope(
      version: 1,
      payload: '',
      signature: '',
      keyId: '',
    );
    expect(guard.canApply(incomplete, const _Verifier(true)), isFalse);
  });

  test('keeps bounded verified rollback history', () {
    final history = VerifiedConfigHistory(capacity: 2)
      ..remember(const SignedConfigEnvelope(
        version: 1,
        payload: 'one',
        signature: 'sig-1',
        keyId: 'key',
      ))
      ..remember(valid)
      ..remember(const SignedConfigEnvelope(
        version: 3,
        payload: 'three',
        signature: 'sig-3',
        keyId: 'key',
      ));

    expect(history.rollbackCandidate(beforeVersion: 3)?.version, 2);
    expect(history.rollbackCandidate(beforeVersion: 2), isNull);
  });
}
