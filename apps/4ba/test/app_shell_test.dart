import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_ba_app/main.dart';
import 'package:provider_sdk/provider_sdk.dart';

final class _DiscoveryProvider implements Provider, ContentDiscoveryProvider {
  @override
  ProviderDescriptor get descriptor => const ProviderDescriptor(
        providerId: 'test',
        version: '1',
        capabilities: {Capability.search, Capability.metadata},
        configurationSchemaVersion: 1,
      );

  @override
  Future<List<CanonicalContent>> search(String query) async => const [
        CanonicalContent(
          canonicalId: 'test-result',
          type: ContentType.series,
          titles: [LocalizedTitle(languageTag: 'ar', value: 'نتيجة حقيقية')],
        ),
      ];

  @override
  Future<CanonicalContent?> details(String canonicalId) async =>
      const CanonicalContent(
        canonicalId: 'test-result',
        type: ContentType.series,
        titles: [LocalizedTitle(languageTag: 'ar', value: 'تفاصيل المزود')],
      );

  @override
  Future<List<EpisodeRef>> episodes(CanonicalContent content) async => const [
        EpisodeRef(
          canonicalContentId: 'test-result',
          season: 2,
          episode: 3,
          title: 'حلقة المزود',
        ),
      ];

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async =>
      const ResolveResult(candidates: []);

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;
}

void main() {
  testWidgets('search renders provider discovery result and opens details',
      (tester) async {
    final registry = ProviderRegistry()..register(_DiscoveryProvider());
    await tester.pumpWidget(
      MaterialApp(home: FourBaAppShell(registry: registry)),
    );

    await tester.tap(find.text('البحث'));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'اختبار');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text('نتيجة حقيقية'), findsOneWidget);
    expect(find.text('محتوى تجريبي محلي'), findsNothing);

    await tester.tap(find.text('نتيجة حقيقية'));
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text('تفاصيل المزود'), findsOneWidget);
    expect(find.text('الحلقات'), findsOneWidget);

    await tester.tap(find.text('الحلقات'));
    await tester.pumpAndSettle();
    expect(find.text('حلقة المزود'), findsOneWidget);
    expect(find.text('الموسم 2'), findsOneWidget);
    expect(find.text('الحلقة 1'), findsNothing);
  });
}

