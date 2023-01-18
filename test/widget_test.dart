// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stratagile_voicecontroll/main.dart';

void main() {
  testWidgets('Test for the second screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);



    /// first of all find the widget we need here
    final gotoSecondPage = find.byKey(ValueKey('SecondPageButton'));


    /// execute the actuall testing 
    
    await tester.pumpWidget(const MaterialApp(home: MyHomePage(title: 'Flutter Demo Home Page')));

    await tester.tap(gotoSecondPage);

   await tester.pump(); /// this will set state the screen

    ///


    expect(find.text('Go to Second Page'), findsOneWidget);

  });
  testWidgets('Test for the increment Widget', (WidgetTester tester) async {



    /// first of all find the widget we need here
    final incrementCounter = find.byKey(ValueKey('IncrementCounter'));


    /// execute the actuall testing

    await tester.pumpWidget(const MaterialApp(home: MyHomePage(title: 'Flutter Demo Home Page')));

    await tester.tap(incrementCounter);

   await tester.pump(); /// this will set state the screen

    ///

    expect(find.byIcon(Icons.add), findsOneWidget);

  });
}
