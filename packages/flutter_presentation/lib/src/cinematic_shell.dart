import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:presentation_contract/presentation_contract.dart';

Color _color(int value) => Color(value);

final class FourBaCinematicShell extends StatelessWidget {
  const FourBaCinematicShell({
    super.key,
    required this.contextModel,
    required this.child,
    this.destinations = const ['الرئيسية', 'الأفلام', 'المسلسلات', 'البحث'],
  });

  final FourBaPresentationContext contextModel;
  final Widget child;
  final List<String> destinations;

  @override
  Widget build(BuildContext context) {
    final adapter = FourBaPresentationAdapter(contextModel);
    final rtl = contextModel.direction == FourBaTextDirection.rtl;
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _color(FourBaColorTokens.canvas),
      colorScheme: ColorScheme.dark(
        primary: _color(FourBaColorTokens.gold),
        surface: _color(FourBaColorTokens.base),
        error: _color(FourBaColorTokens.error),
      ),
      focusColor: _color(FourBaColorTokens.focusRing),
    );

    return Directionality(
      textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(contextModel.textScale),
          disableAnimations: contextModel.reduceMotion,
          highContrast: contextModel.highContrast,
        ),
        child: Theme(
          data: theme,
          child: Scaffold(
            body: adapter.navigation == FourBaNavigationKind.tvSidebar
                ? Row(
                    children: [
                      _TvNavigation(destinations: destinations),
                      Expanded(child: child),
                    ],
                  )
                : child,
            bottomNavigationBar:
                adapter.navigation == FourBaNavigationKind.bottomBar
                    ? NavigationBar(
                        destinations: [
                          for (final label in destinations.take(4))
                            NavigationDestination(
                              icon: const Icon(Icons.circle_outlined),
                              label: label,
                            ),
                        ],
                      )
                    : null,
          ),
        ),
      ),
    );
  }
}

final class _TvNavigation extends StatelessWidget {
  const _TvNavigation({required this.destinations});

  final List<String> destinations;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 260,
        child: ListView(
          padding: const EdgeInsets.all(FourBaSpacing.x6),
          children: [
            for (final label in destinations)
              Padding(
                padding: const EdgeInsets.only(bottom: FourBaSpacing.x3),
                child: FourBaFocusTile(label: label),
              ),
          ],
        ),
      );
}

final class FourBaCinematicButton extends StatefulWidget {
  const FourBaCinematicButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.autofocus = false,
    this.isTenFoot = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool autofocus;
  final bool isTenFoot;

  @override
  State<FourBaCinematicButton> createState() => _FourBaCinematicButtonState();
}

final class _FourBaCinematicButtonState extends State<FourBaCinematicButton> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    final metrics = FourBaComponents.button(
      kind: FourBaButtonKind.primary,
      isTenFoot: widget.isTenFoot,
    );
    return FocusableActionDetector(
      autofocus: widget.autofocus,
      enabled: widget.onPressed != null,
      onShowFocusHighlight: (value) => setState(() => focused = value),
      child: AnimatedScale(
        scale: focused ? FourBaFocus.scale : 1,
        duration: Duration(
          milliseconds: MediaQuery.disableAnimationsOf(context)
              ? 0
              : FourBaMotion.shortMs,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: metrics.minimumTarget),
          child: FilledButton.icon(
            onPressed: widget.onPressed,
            icon: Icon(widget.icon ?? Icons.play_arrow),
            label: Text(widget.label),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: metrics.contentPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(metrics.radius),
                side: focused
                    ? BorderSide(
                        color: _color(FourBaColorTokens.focusRing),
                        width: FourBaFocus.ringWidth,
                      )
                    : BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class FourBaContentCard extends StatelessWidget {
  const FourBaContentCard({
    super.key,
    required this.title,
    required this.child,
    this.onTap,
  });

  final String title;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: onTap != null,
        label: title,
        child: Card(
          color: _color(FourBaColorTokens.raised),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FourBaRadius.card),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(FourBaSpacing.x4),
              child: child,
            ),
          ),
        ),
      );
}

final class FourBaFocusTile extends StatefulWidget {
  const FourBaFocusTile({super.key, required this.label});

  final String label;

  @override
  State<FourBaFocusTile> createState() => _FourBaFocusTileState();
}

final class _FourBaFocusTileState extends State<FourBaFocusTile> {
  bool focused = false;

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
        onShowFocusHighlight: (value) => setState(() => focused = value),
        child: AnimatedScale(
          scale: focused ? FourBaFocus.scale : 1,
          duration: Duration(
            milliseconds: MediaQuery.disableAnimationsOf(context)
                ? 0
                : FourBaMotion.shortMs,
          ),
          child: Container(
            constraints:
                const BoxConstraints(minHeight: FourBaFocus.tvMinimumTarget),
            padding: const EdgeInsets.symmetric(horizontal: FourBaSpacing.x4),
            decoration: BoxDecoration(
              color: _color(FourBaColorTokens.raised),
              borderRadius: BorderRadius.circular(FourBaRadius.control),
              border: focused
                  ? Border.all(
                      color: _color(FourBaColorTokens.focusRing),
                      width: FourBaFocus.ringWidth,
                    )
                  : null,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(widget.label),
          ),
        ),
      );
}
