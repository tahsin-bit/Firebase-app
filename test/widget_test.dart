// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:roktalap/main.dart'; // Updated import to roktalap

void main() {
  testWidgets('Login screen shows Roktalap title and Login button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that "Roktalap" title is present.
    expect(find.text('Roktalap'), findsOneWidget);

    // Verify that the "Login" button is present.
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

    // Verify that "Email or Phone" and "Password" text fields are present.
    expect(find.widgetWithText(TextFormField, 'Email or Phone'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
  });
}
