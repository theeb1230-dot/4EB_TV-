import 'package:design_tokens/design_tokens.dart';
import 'package:test/test.dart';

void main() {
  test('layout classification is capability based', () {
    expect(
      FourBaBreakpoints.classify(logicalWidth: 390, isTenFoot: false),
      FourBaLayoutClass.compact,
    );
    expect(
      FourBaBreakpoints.classify(logicalWidth: 800, isTenFoot: false),
      FourBaLayoutClass.medium,
    );
    expect(
      FourBaBreakpoints.classify(logicalWidth: 1280, isTenFoot: false),
      FourBaLayoutClass.expanded,
    );
    expect(
      FourBaBreakpoints.classify(logicalWidth: 390, isTenFoot: true),
      FourBaLayoutClass.tv,
    );
  });

  test('reduce motion removes token animation duration', () {
    expect(FourBaMotion.durationMs(reduceMotion: true), 0);
    expect(
      FourBaMotion.durationMs(reduceMotion: false),
      FourBaMotion.standardMs,
    );
  });

  test('focus targets preserve accessibility minimums', () {
    expect(FourBaFocus.minimumTarget, greaterThanOrEqualTo(48));
    expect(FourBaFocus.tvMinimumTarget, greaterThan(FourBaFocus.minimumTarget));
  });
}
