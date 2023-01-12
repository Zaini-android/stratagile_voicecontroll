import 'package:flutter_test/flutter_test.dart';
import 'package:stratagile_voicecontroll/main.dart';


void main() {



  test('Testing the increment counter', () {
    /// Setup
    final homePage = MyHomePageState();

    

    /// do

    homePage.incrementCounter();
    homePage.decrementCounter();



    /// test


    expect(homePage.counter.toString(), '0');







  });

}