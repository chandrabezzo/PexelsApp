import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Pexel App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(MyApp(prefs));

    expect(find.text("Pexels"), findsOneWidget);

    expect(find.byIcon(Icons.grid_view), findsOneWidget);
    expect(find.byIcon(Icons.list), findsOneWidget);

    await tester.scrollUntilVisible(find.text("Eva Elijas"), 100);

    await tester.tap(find.byIcon(Icons.list));
  });
}