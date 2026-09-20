enum AppLocale { ar, en, tr }

enum LayoutDirection { rtl, ltr }

final class LocalizationConfig {
  const LocalizationConfig({
    this.defaultLocale = AppLocale.ar,
    this.supportedLocales = const <AppLocale>[
      AppLocale.ar,
      AppLocale.en,
      AppLocale.tr,
    ],
  });

  final AppLocale defaultLocale;
  final List<AppLocale> supportedLocales;

  LayoutDirection directionFor(AppLocale locale) =>
      locale == AppLocale.ar ? LayoutDirection.rtl : LayoutDirection.ltr;

  bool supports(AppLocale locale) => supportedLocales.contains(locale);
}

final class NetworkPolicy {
  const NetworkPolicy({
    this.connectTimeout = const Duration(seconds: 10),
    this.readTimeout = const Duration(seconds: 20),
    this.maxRetries = 2,
    this.allowCleartext = false,
  });

  final Duration connectTimeout;
  final Duration readTimeout;
  final int maxRetries;
  final bool allowCleartext;

  bool get requiresTls => !allowCleartext;
}

final class SecurityPolicy {
  const SecurityPolicy({
    this.allowExternalPlayback = false,
    this.allowRawSecretsInDiagnostics = false,
    this.allowAdvertisingTracking = false,
    this.allowDrmBypass = false,
  });

  final bool allowExternalPlayback;
  final bool allowRawSecretsInDiagnostics;
  final bool allowAdvertisingTracking;
  final bool allowDrmBypass;

  bool get satisfiesProductBaseline =>
      !allowExternalPlayback &&
      !allowRawSecretsInDiagnostics &&
      !allowAdvertisingTracking &&
      !allowDrmBypass;
}

final class AccessibilityPolicy {
  const AccessibilityPolicy({
    this.minimumTouchTarget = 48,
    this.minimumTvFocusTarget = 56,
    this.requireSemanticLabels = true,
    this.requireVisibleTvFocus = true,
    this.respectReducedMotion = true,
  });

  final double minimumTouchTarget;
  final double minimumTvFocusTarget;
  final bool requireSemanticLabels;
  final bool requireVisibleTvFocus;
  final bool respectReducedMotion;
}

final class RuntimeConfig {
  const RuntimeConfig({
    this.localization = const LocalizationConfig(),
    this.network = const NetworkPolicy(),
    this.security = const SecurityPolicy(),
    this.accessibility = const AccessibilityPolicy(),
  });

  final LocalizationConfig localization;
  final NetworkPolicy network;
  final SecurityPolicy security;
  final AccessibilityPolicy accessibility;
}
