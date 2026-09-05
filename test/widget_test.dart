import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trnp_app/main.dart';

void main() {
  testWidgets('TrnpApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TrnpApp(),
      ),
    );
    expect(find.byType(TrnpApp), findsOneWidget);
  });
}
