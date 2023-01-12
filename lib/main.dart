import 'dart:convert';

import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';

import 'newPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});


  final String? title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;


  @override
  void initState() {
    // TODO: implement initState

    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton("7ca3911860097c81bd430ee9060c56242e956eca572e1d8b807a3e2338fdd0dc/stage",buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));


    super.initState();
  }

  Future<String> sendData() async {

    var isActive = await AlanVoice.isActive();

    if (!isActive){
      AlanVoice.activate();
    }

    print('Getting in send data');
    var params = jsonEncode({"count": counter,"screen": 'This is home page'});
    AlanVoice.callProjectApi("script::getCount",params);
    return "ok";
  }


  _handleCommand(Map<String,dynamic> command){

    switch(command['command']){
      case 'increment':
        incrementCounter();

        break;
        case 'forward':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        break;
        case 'back':
        Navigator.pop(context);
        break;
      default:
        debugPrint('Unknown Command');

    }


  }


   void incrementCounter() {
    // setState(() {
      counter++;
      // sendData();
    // });
  }
  void decrementCounter() {
    // setState(() {
      counter--;
      // sendData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            }, child: Text('Go to Second Page'))



          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          incrementCounter();
          // sendData();

          },

        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
