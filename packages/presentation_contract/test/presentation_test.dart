import 'package:design_tokens/design_tokens.dart';
import 'package:presentation_contract/presentation_contract.dart';
import 'package:test/test.dart';

void main() {
  test('Arabic is RTL by default and compact navigation is mobile-first', () {
    const adapter = FourBaPresentationAdapter(
      FourBaPresentationContext(logicalWidth: 390, isTenFoot: false),
    );
    expect(adapter.context.direction, FourBaTextDirection.rtl);
    expect(adapter.navigation, FourBaNavigationKind.bottomBar);
  });

  test('English and Turkish remain LTR', () {
    for (final locale in [FourBaLocale.en, FourBaLocale.tr]) {
      final context = FourBaPresentationContext(
        logicalWidth: 800,
        isTenFoot: false,
        locale: locale,
      );
      expect(context.direction, FourBaTextDirection.ltr);
    }
  });

  test('TV uses dedicated navigation, larger controls and two focus cues', () {
    const phone = FourBaPresentationAdapter(
      FourBaPresentationContext(logicalWidth: 1920, isTenFoot: false),
    );
    const tv = FourBaPresentationAdapter(
      FourBaPresentationContext(logicalWidth: 1920, isTenFoot: true),
    );
    expect(phone.navigation, FourBaNavigationKind.sidebar);
    expect(tv.navigation, FourBaNavigationKind.tvSidebar);
    expect(tv.button(FourBaButtonKind.primary).minimumTarget,
        FourBaFocus.tvMinimumTarget);
    expect(tv.playerControlTarget, FourBaFocus.tvMinimumTarget);
    expect(tv.focusCues.length, greaterThanOrEqualTo(2));
  });

  test('reduce motion and text scaling are applied by the adapter', () {
    const adapter = FourBaPresentationAdapter(
      FourBaPresentationContext(
        logicalWidth: 390,
        isTenFoot: false,
        reduceMotion: true,
        textScale: 1.5,
      ),
    );
    expect(adapter.motionDuration(), 0);
    expect(
      adapter.text(FourBaTextRole.body).size,
      FourBaTypography.roles[FourBaTextRole.body]!.size * 1.5,
    );
  });

  test('player controls stay provider-neutral and include recovery', () {
    const adapter = FourBaPresentationAdapter(
      FourBaPresentationContext(logicalWidth: 390, isTenFoot: false),
    );
    expect(adapter.playerControls, contains(FourBaPlayerControl.sourceRecovery));
    expect(adapter.playerControls, contains(FourBaPlayerControl.subtitles));
    expect(adapter.playerControls, contains(FourBaPlayerControl.quality));
  });
}
