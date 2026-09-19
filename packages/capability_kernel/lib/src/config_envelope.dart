/// Provider-neutral metadata for a remotely distributed configuration.
///
/// Cryptographic verification is intentionally injected by the composition
/// root. The kernel never trusts transport, provider code, or a remote server.
final class SignedConfigEnvelope {
  const SignedConfigEnvelope({
    required this.version,
    required this.payload,
    required this.signature,
    required this.keyId,
  });

  final int version;
  final String payload;
  final String signature;
  final String keyId;
}

abstract interface class ConfigSignatureVerifier {
  bool verify(SignedConfigEnvelope envelope);
}

final class ConfigVersionGuard {
  ConfigVersionGuard({this.acceptedVersion = 0});

  int acceptedVersion;

  bool canApply(
    SignedConfigEnvelope envelope,
    ConfigSignatureVerifier verifier,
  ) {
    if (envelope.version <= acceptedVersion) return false;
    if (envelope.payload.isEmpty ||
        envelope.signature.isEmpty ||
        envelope.keyId.isEmpty) {
      return false;
    }
    return verifier.verify(envelope);
  }

  void markApplied(int version) {
    if (version <= acceptedVersion) {
      throw StateError('Configuration version must advance monotonically');
    }
    acceptedVersion = version;
  }
}

/// Local rollback history stores only already-verified envelopes.
final class VerifiedConfigHistory {
  VerifiedConfigHistory({this.capacity = 3}) {
    if (capacity < 1) throw ArgumentError.value(capacity, 'capacity');
  }

  final int capacity;
  final List<SignedConfigEnvelope> _verified = [];

  void remember(SignedConfigEnvelope envelope) {
    _verified.removeWhere((item) => item.version == envelope.version);
    _verified.insert(0, envelope);
    if (_verified.length > capacity) {
      _verified.removeRange(capacity, _verified.length);
    }
  }

  SignedConfigEnvelope? rollbackCandidate({required int beforeVersion}) {
    for (final envelope in _verified) {
      if (envelope.version < beforeVersion) return envelope;
    }
    return null;
  }
}
