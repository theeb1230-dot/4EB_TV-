import 'package:design_tokens/design_tokens.dart';
import 'package:test/test.dart';

void main() {
  test('every typography role has a usable metric', () {
    expect(FourBaTypography.roles.keys.toSet(), FourBaTextRole.values.toSet());
    for (final token in FourBaTypography.roles.values) {
      expect(token.size, greaterThan(0));
      expect(token.lineHeight, greaterThanOrEqualTo(1));
      expect(token.weight, inInclusiveRange(100, 900));
    }
  });

  test('ten-foot controls preserve larger accessibility targets', () {
    final phone = FourBaComponents.button(
      kind: FourBaButtonKind.primary,
      isTenFoot: false,
    );
    final tv = FourBaComponents.button(
      kind: FourBaButtonKind.primary,
      isTenFoot: true,
    );
    expect(phone.minimumTarget, FourBaFocus.minimumTarget);
    expect(tv.minimumTarget, FourBaFocus.tvMinimumTarget);
    expect(tv.minimumTarget, greaterThan(phone.minimumTarget));
    expect(tv.contentPadding, greaterThan(phone.contentPadding));
  });

  test('responsive card gaps increase without scaling phone canvas', () {
    expect(FourBaComponents.cardGap(FourBaLayoutClass.compact), FourBaSpacing.x3);
    expect(FourBaComponents.cardGap(FourBaLayoutClass.medium), FourBaSpacing.x4);
    expect(FourBaComponents.cardGap(FourBaLayoutClass.expanded), FourBaSpacing.x6);
    expect(FourBaComponents.cardGap(FourBaLayoutClass.tv), FourBaSpacing.x8);
  });
}
