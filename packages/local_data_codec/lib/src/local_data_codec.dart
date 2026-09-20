import 'dart:convert';

import 'package:core_domain/core_domain.dart';

final class LocalDataCodec {
  const LocalDataCodec();

  String encodeCachedValue(CachedValue value) => jsonEncode(<String, Object?>{
        'value': value.value,
        'storedAt': value.storedAt.toUtc().toIso8601String(),
        'expiresAt': value.expiresAt?.toUtc().toIso8601String(),
      });

  CachedValue decodeCachedValue(String encoded) {
    final decoded = jsonDecode(encoded);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Cached value must be a JSON object.');
    }

    final value = decoded['value'];
    final storedAt = _date(decoded['storedAt'], 'storedAt');
    final expiresAtRaw = decoded['expiresAt'];
    if (value is! String) {
      throw const FormatException('Cached value payload must be a string.');
    }

    return CachedValue(
      value: value,
      storedAt: storedAt,
      expiresAt: expiresAtRaw == null ? null : _date(expiresAtRaw, 'expiresAt'),
    );
  }

  String encodeDiagnostic(LocalDiagnosticEvent event) =>
      jsonEncode(<String, Object?>{
        'code': event.code,
        'occurredAt': event.occurredAt.toUtc().toIso8601String(),
        'attributes': event.attributes,
      });

  LocalDiagnosticEvent decodeDiagnostic(String encoded) {
    final decoded = jsonDecode(encoded);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Diagnostic event must be a JSON object.');
    }

    final code = decoded['code'];
    final attributes = decoded['attributes'];
    if (code is! String || attributes is! Map<String, dynamic>) {
      throw const FormatException('Invalid diagnostic event.');
    }

    return LocalDiagnosticEvent(
      code: code,
      occurredAt: _date(decoded['occurredAt'], 'occurredAt'),
      attributes: attributes.map((key, value) {
        if (value is! String) {
          throw const FormatException('Diagnostic attributes must be strings.');
        }
        return MapEntry(key, value);
      }),
    );
  }

  DateTime _date(Object? value, String field) {
    if (value is! String) {
      throw FormatException('$field must be an ISO-8601 string.');
    }
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      throw FormatException('$field must be a valid ISO-8601 timestamp.');
    }
    return parsed.toUtc();
  }
}
