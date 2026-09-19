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
  static FourBaLayoutClass classify({required double logicalWidth, required bool isTenFoot}) {
    if (isTenFoot) return FourBaLayoutClass.tv;
    if (logicalWidth < 600) return FourBaLayoutClass.compact;
    if (logicalWidth < 1024) return FourBaLayoutClass.medium;
    return FourBaLayoutClass.expanded;
  }
}

abstract final class FourBaMotion {
  static const shortMs = 140;
  static const standardMs = 220;
  static int durationMs({required bool reduceMotion, int normalMs = standardMs}) =>
      reduceMotion ? 0 : normalMs;
}

abstract final class FourBaFocus {
  static const scale = 1.06;
  static const ringWidth = 3.0;
  static const minimumTarget = 48.0;
  static const tvMinimumTarget = 56.0;
}

enum FourBaTextRole { display, heroTitle, titleLarge, title, body, bodyCompact, label, caption, playerTime }

final class FourBaTextToken {
  const FourBaTextToken({required this.size, required this.lineHeight, required this.weight});
  final double size;
  final double lineHeight;
  final int weight;
}

abstract final class FourBaTypography {
  static const roles = <FourBaTextRole, FourBaTextToken>{
    FourBaTextRole.display: FourBaTextToken(size: 48, lineHeight: 1.12, weight: 700),
    FourBaTextRole.heroTitle: FourBaTextToken(size: 36, lineHeight: 1.18, weight: 700),
    FourBaTextRole.titleLarge: FourBaTextToken(size: 28, lineHeight: 1.22, weight: 700),
    FourBaTextRole.title: FourBaTextToken(size: 22, lineHeight: 1.28, weight: 600),
    FourBaTextRole.body: FourBaTextToken(size: 16, lineHeight: 1.5, weight: 400),
    FourBaTextRole.bodyCompact: FourBaTextToken(size: 14, lineHeight: 1.45, weight: 400),
    FourBaTextRole.label: FourBaTextToken(size: 14, lineHeight: 1.3, weight: 600),
    FourBaTextRole.caption: FourBaTextToken(size: 12, lineHeight: 1.35, weight: 400),
    FourBaTextRole.playerTime: FourBaTextToken(size: 13, lineHeight: 1.2, weight: 500),
  };
}

enum FourBaCardKind { poster, hero, episode, channel, match, collection, download }
enum FourBaButtonKind { primary, secondary, danger, advancedSources }
enum FourBaNavigationKind { bottomBar, rail, sidebar, tvSidebar }
enum FourBaPlayerControl { playPause, timeline, audio, subtitles, quality, previous, next, sourceRecovery }

final class FourBaComponentMetrics {
  const FourBaComponentMetrics({required this.radius, required this.minimumTarget, required this.contentPadding});
  final double radius;
  final double minimumTarget;
  final double contentPadding;
}

abstract final class FourBaComponents {
  static FourBaComponentMetrics button({required FourBaButtonKind kind, required bool isTenFoot}) {
    final target = isTenFoot ? FourBaFocus.tvMinimumTarget : FourBaFocus.minimumTarget;
    return FourBaComponentMetrics(
      radius: FourBaRadius.control,
      minimumTarget: target,
      contentPadding: isTenFoot ? FourBaSpacing.x6 : FourBaSpacing.x4,
    );
  }

  static FourBaNavigationKind navigation(FourBaLayoutClass layout) => switch (layout) {
        FourBaLayoutClass.compact => FourBaNavigationKind.bottomBar,
        FourBaLayoutClass.medium => FourBaNavigationKind.rail,
        FourBaLayoutClass.expanded => FourBaNavigationKind.sidebar,
        FourBaLayoutClass.tv => FourBaNavigationKind.tvSidebar,
      };

  static double cardGap(FourBaLayoutClass layout) => switch (layout) {
        FourBaLayoutClass.compact => FourBaSpacing.x3,
        FourBaLayoutClass.medium => FourBaSpacing.x4,
        FourBaLayoutClass.expanded => FourBaSpacing.x6,
        FourBaLayoutClass.tv => FourBaSpacing.x8,
      };

  static double playerControlTarget({required bool isTenFoot}) =>
      isTenFoot ? FourBaFocus.tvMinimumTarget : FourBaFocus.minimumTarget;
}
