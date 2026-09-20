import 'package:flutter/material.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() => runApp(const FourBaApp());

enum FourBaSection { home, movies, series, search, settings }

final class FourBaApp extends StatelessWidget {
  const FourBaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '4BA Cinematic Gold',
        theme: ThemeData.dark(useMaterial3: true),
        home: const FourBaAppShell(),
      );
}

final class FourBaAppShell extends StatefulWidget {
  const FourBaAppShell({super.key});

  @override
  State<FourBaAppShell> createState() => _FourBaAppShellState();
}

final class _FourBaAppShellState extends State<FourBaAppShell> {
  FourBaSection section = FourBaSection.home;

  static const labels = <FourBaSection, String>{
    FourBaSection.home: 'الرئيسية',
    FourBaSection.movies: 'الأفلام',
    FourBaSection.series: 'المسلسلات',
    FourBaSection.search: 'البحث',
    FourBaSection.settings: 'الإعدادات',
  };

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final media = MediaQuery.of(context);
          final tenFoot = constraints.maxWidth >= 1200;
          final presentation = FourBaPresentationContext(
            logicalWidth: constraints.maxWidth,
            isTenFoot: tenFoot,
            locale: FourBaLocale.ar,
            reduceMotion: media.disableAnimations,
            highContrast: media.highContrast,
            textScale: media.textScaler.scale(1),
          );
          return FourBaCinematicShell(
            contextModel: presentation,
            destinations: labels.values.toList(growable: false),
            child: SafeArea(
              child: _SectionBody(
                section: section,
                onSelect: (value) => setState(() => section = value),
              ),
            ),
          );
        },
      );
}

final class _SectionBody extends StatelessWidget {
  const _SectionBody({required this.section, required this.onSelect});

  final FourBaSection section;
  final ValueChanged<FourBaSection> onSelect;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '4BA',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final item in FourBaSection.values)
                  FilledButton.tonal(
                    onPressed: () => onSelect(item),
                    child: Text(_FourBaAppShellState.labels[item]!),
                  ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Semantics(
                  header: true,
                  child: Text(
                    _FourBaAppShellState.labels[section]!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
