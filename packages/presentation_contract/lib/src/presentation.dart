import 'package:design_tokens/design_tokens.dart';

enum FourBaLocale { ar, en, tr }

enum FourBaTextDirection { rtl, ltr }

enum FourBaFocusCue { ring, scale, elevation, labelReveal }

final class FourBaPresentationContext {
  const FourBaPresentationContext({
    required this.logicalWidth,
    required this.isTenFoot,
    this.locale = FourBaLocale.ar,
    this.reduceMotion = false,
    this.highContrast = false,
    this.textScale = 1.0,
  })  : assert(logicalWidth >= 0),
        assert(textScale > 0);

  final double logicalWidth;
  final bool isTenFoot;
  final FourBaLocale locale;
  final bool reduceMotion;
  final bool highContrast;
  final double textScale;

  FourBaLayoutClass get layout => FourBaBreakpoints.classify(
        logicalWidth: logicalWidth,
        isTenFoot: isTenFoot,
      );

  FourBaTextDirection get direction => locale == FourBaLocale.ar
      ? FourBaTextDirection.rtl
      : FourBaTextDirection.ltr;
}

final class FourBaPresentationAdapter {
  const FourBaPresentationAdapter(this.context);

  final FourBaPresentationContext context;

  FourBaNavigationKind get navigation =>
      FourBaComponents.navigation(context.layout);

  FourBaComponentMetrics button(FourBaButtonKind kind) =>
      FourBaComponents.button(kind: kind, isTenFoot: context.isTenFoot);

  FourBaTextToken text(FourBaTextRole role) {
    final token = FourBaTypography.roles[role]!;
    return FourBaTextToken(
      size: token.size * context.textScale,
      lineHeight: token.lineHeight,
      weight: token.weight,
    );
  }

  int motionDuration([int normalMs = FourBaMotion.standardMs]) =>
      FourBaMotion.durationMs(
        reduceMotion: context.reduceMotion,
        normalMs: normalMs,
      );

  List<FourBaFocusCue> get focusCues => context.isTenFoot
      ? const [FourBaFocusCue.ring, FourBaFocusCue.scale]
      : const [FourBaFocusCue.ring];

  double get cardGap => FourBaComponents.cardGap(context.layout);

  double get playerControlTarget =>
      FourBaComponents.playerControlTarget(isTenFoot: context.isTenFoot);

  List<FourBaPlayerControl> get playerControls => const [
        FourBaPlayerControl.playPause,
        FourBaPlayerControl.timeline,
        FourBaPlayerControl.audio,
        FourBaPlayerControl.subtitles,
        FourBaPlayerControl.quality,
        FourBaPlayerControl.previous,
        FourBaPlayerControl.next,
        FourBaPlayerControl.sourceRecovery,
      ];
}
