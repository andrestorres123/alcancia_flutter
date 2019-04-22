// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child presentation.sections.checklist.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:alcancia_flutter/presentation/sections/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alcancia_flutter/di/di_config.dart';
import 'package:alcancia_flutter/main.dart';

void main() {
  testWidgets('If email is empty show error', (WidgetTester tester) async {
    configureTestDI();
    await tester.pumpWidget(new MaterialApp(
      home: LoginPage(),
    ));

    await tester.enterText(find.byKey(Key('emailKey')), '');
    await tester.enterText(find.byKey(Key('passwordKey')), '');

    TextFormField emailTextField = tester.widget(find.byKey(Key('emailKey')));
    TextFormField passwordTextField =
        tester.widget(find.byKey(Key('passwordKey')));
    await tester.tap(find.byKey(Key('loginBtn')));

    expect(emailTextField.validator, isNotNull);
    expect(passwordTextField.validator, isNotNull);
  });
}
