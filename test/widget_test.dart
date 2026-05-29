import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textile_mobile_app/app/ayyash_app.dart';

void main() {
  testWidgets('App shell renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AyyashApp()));
    expect(find.text("Ayyash's Textile Shop"), findsWidgets);
  });
}
