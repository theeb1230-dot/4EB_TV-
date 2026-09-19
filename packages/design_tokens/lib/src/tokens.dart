/// Platform-neutral semantic tokens for the official 4BA Cinematic Gold
/// experience. UI packages consume these roles instead of hard-coded values.
abstract final class FourBaColorTokens {
  static const canvas = 0xFF090A0C;
  static const base = 0xFF111318;
  static const raised = 0xFF1A1D23;
  static const overlay = 0xD9000000;
  static const textPrimary = 0xFFF7F2E8;
  static const textSecondary = 0xFFB8B4AC;
  static const gold = 0xFFD6B56D;
  static const goldStrong = 0xFFE5C87C;
  static const live = 0xFFE5484D;
  static const error = 0xFFE5484D;
  static const success = 0xFF4CB782;
  static const focusRing = goldStrong;
}

abstract final class FourBaSpacing {
  static const x1 = 4.0;
  static const x2 = 8.0;
  static const x3 = 12.0;
  static const x4 = 16.0;
  static const x6 = 24.0;
  static const x8 = 32.0;
  static const x12 = 48.0;
  static const x16 = 64.0;
}

abstract final class FourBaRadius {
  static const control = 8.0;
  static const card = 12.0;
  static const sheet = 16.0;
  static const pill = 999.0;
}

enum FourBaLayoutClass { compact, medium, expanded, tv }

abstract final class FourBaBreakpoints {
  static FourBaLayoutClass classify({
    required double logicalWidth,
    required bool isTenFoot,
  }) {
    if (isTenFoot) return FourBaLayoutClass.tv;
    if (logicalWidth < 600) return FourBaLayoutClass.compact;
    if (logicalWidth < 1024) return FourBaLayoutClass.medium;
    return FourBaLayoutClass.expanded;
  }
}

abstract final class FourBaMotion {
  static const shortMs = 140;
  static const standardMs = 220;

  static int durationMs({
    required bool reduceMotion,
    int normalMs = standardMs,
  }) =>
      reduceMotion ? 0 : normalMs;
}

abstract final class FourBaFocus {
  static const scale = 1.06;
  static const ringWidth = 3.0;
  static const minimumTarget = 48.0;
  static const tvMinimumTarget = 56.0;
}
