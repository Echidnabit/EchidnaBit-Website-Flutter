import 'package:echidnabit_website_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders landing page content', (tester) async {
    await tester.pumpWidget(const EchidnabitWebsiteApp());

    expect(find.text('Echidnabit'), findsOneWidget);
    expect(find.text('Tessellate'), findsOneWidget);
    expect(find.text('Pitchi'), findsOneWidget);
    expect(find.text('Contact me'), findsOneWidget);
  });
}
