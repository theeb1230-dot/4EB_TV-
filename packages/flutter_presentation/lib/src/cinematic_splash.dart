import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';

import 'brand_mark.dart';

/// Brief, network-independent splash. Completion is caller-owned so startup
/// never waits for remote configuration or a backend.
final class FourBaCinematicSplash extends StatelessWidget {
  const FourBaCinematicSplash({
    super.key,
    this.reduceMotion = false,
    this.progress = 1,
  });

  final bool reduceMotion;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final value = progress.clamp(0.0, 1.0);
    return ColoredBox(
      color: const Color(FourBaColorTokens.canvas),
      child: Center(
        child: Semantics(
          label: '4BA Cinematic Gold',
          child: AnimatedOpacity(
            opacity: value,
            duration: Duration(
              milliseconds: FourBaMotion.durationMs(
                reduceMotion: reduceMotion,
                normalMs: FourBaMotion.standardMs,
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FourBaBrandMark(size: 112),
                SizedBox(height: FourBaSpacing.x4),
                Text(
                  '4BA',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Color(FourBaColorTokens.textPrimary),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
