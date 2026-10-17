import 'package:flutter_test/flutter_test.dart';
import 'package:raniya_portfolio/main.dart';

void main() {
  testWidgets('Raniya Portfolio smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RaniyaPortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Raniya Kazi'), findsWidgets);
    expect(find.text('Hi, I am'), findsOneWidget);
  });
}
