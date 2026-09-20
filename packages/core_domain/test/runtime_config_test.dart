import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('runtime defaults preserve Arabic RTL product baseline', () {
    const config = RuntimeConfig();

    expect(config.localization.defaultLocale, AppLocale.ar);
    expect(config.localization.directionFor(AppLocale.ar), LayoutDirection.rtl);
    expect(config.localization.directionFor(AppLocale.en), LayoutDirection.ltr);
    expect(config.localization.directionFor(AppLocale.tr), LayoutDirection.ltr);
    expect(config.localization.supports(AppLocale.ar), isTrue);
    expect(config.localization.supports(AppLocale.en), isTrue);
    expect(config.localization.supports(AppLocale.tr), isTrue);
  });

  test('network defaults require TLS and bounded retries', () {
    const policy = NetworkPolicy();

    expect(policy.requiresTls, isTrue);
    expect(policy.connectTimeout, const Duration(seconds: 10));
    expect(policy.readTimeout, const Duration(seconds: 20));
    expect(policy.maxRetries, 2);
  });

  test('security defaults reject unsafe product capabilities', () {
    const policy = SecurityPolicy();

    expect(policy.satisfiesProductBaseline, isTrue);
    expect(policy.allowExternalPlayback, isFalse);
    expect(policy.allowRawSecretsInDiagnostics, isFalse);
    expect(policy.allowAdvertisingTracking, isFalse);
    expect(policy.allowDrmBypass, isFalse);
  });

  test('accessibility defaults establish touch and TV focus floors', () {
    const policy = AccessibilityPolicy();

    expect(policy.minimumTouchTarget, greaterThanOrEqualTo(48));
    expect(policy.minimumTvFocusTarget, greaterThanOrEqualTo(48));
    expect(policy.requireSemanticLabels, isTrue);
    expect(policy.requireVisibleTvFocus, isTrue);
    expect(policy.respectReducedMotion, isTrue);
  });
}
