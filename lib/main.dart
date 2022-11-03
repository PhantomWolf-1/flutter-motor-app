import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

void main() {

  //here i can start retrieving possible min and max values for the sliders (can do it hard coded but that isn't reusable)
  //retrieving these values through api call to FLASK!!!
  print("Launching motor web app");
  //-------------------------------------

  //Here starts the application
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TestPage> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _goNextPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MySliderApp()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
        alignment: Alignment.center,
        //padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/own-bike.jpg'),
        fit: BoxFit.cover,
        ),
        ),
      child:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black87,
              ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: Center(
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have clicked the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    onPressed: _goNextPage,
                    child: const Text('to page'),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _goNextPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MySliderApp()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: _goNextPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MySliderApp extends StatefulWidget {
  const MySliderApp({super.key});




  @override
  _MySliderAppState createState() => _MySliderAppState();
}

class _MySliderAppState extends State<MySliderApp> {
  static const String FLASK_MODEL_URL = "https://motorcycle-model.herokuapp.com/";
  static const String FLASK_MODEL_URL_TEST = "http://127.0.0.1:5000";
  //var inputBoundary;
  //List<int> inputValues = [];


  int _valueSlider1_seatHeight = 87;
  int _valueSlider2_dryWeight = 58;
  int _valueSlider3_wheelbase = 895;
  int _valueSlider4_power = 2;
  int _valueSlider5_displacement = 49;
  int _valueSlider6_torque = 3;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/own-bike.jpg'),
          fit: BoxFit.cover,
        ),
      ),
        child:Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: [
        Colors.black12,
        Colors.black87,
        ],
        ),
       ),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
          title: Text('Flutter Slider page'),
          ),
          body: Center(
          //padding: EdgeInsets.all(0.0),
            child: Container(
              margin: const EdgeInsets.only(left: 400, right: 400,top: 100, bottom: 100),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(//row 1-------------------
                  children: [
                    Slider( //-----------------------------slider 1
                        value: _valueSlider1_seatHeight.toDouble(),
                        min: 87.0,
                        max: 919.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider1_seatHeight = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                    IconButton( //icon slider 1 -------------------------------------
                      icon: ImageIcon(AssetImage('assets/help-icon.png')),
                      tooltip: 'explain feature',
                      onPressed: () {
                        getResponse();
                        setState(() {
                          //_volume += 10;
                        });
                      },
                    ),
                  ],
                ),
                Row(//row 2-------------------
                  children: [
                    Slider( //-----------------------------slider 2
                        value: _valueSlider2_dryWeight.toDouble(),
                        min: 58.0,
                        max: 562.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider2_dryWeight = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                    IconButton( //icon slider 1 -------------------------------------
                      icon: ImageIcon(AssetImage('assets/help-icon.png')),
                      tooltip: 'explain feature',
                      onPressed: () {
                        //getModelInformation();
                        setState(() {
                          //_volume += 10;
                        });
                      },
                    ),
                    IconButton( //icon slider 1 -------------------------------------
                      icon: ImageIcon(AssetImage('assets/help-icon.png')),
                      tooltip: 'explain feature',
                      onPressed: () {
                        setState(() {
                          //_volume += 10;
                        });
                      },
                    ),
                  ],
                ),
                Row(//row 3-------------------
                  children: [
                    Slider( //-----------------------------slider 3
                        value: _valueSlider3_wheelbase.toDouble(),
                        min: 895.0,
                        max: 2261.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider3_wheelbase = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                  ],
                ),
                Row(//row 4-------------------
                  children: [
                    Slider( //-----------------------------slider 4
                        value: _valueSlider4_power.toDouble(),
                        min: 1.7,
                        max: 417.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider4_power = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                  ],
                ),
                Row(//row 5-------------------
                  children: [
                    Slider( //-----------------------------slider 5
                        value: _valueSlider5_displacement.toDouble(),
                        min: 49.0,
                        max: 2575.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider5_displacement = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                  ],
                ),
                Row(//row 6-------------------
                  children: [
                    Slider( //-----------------------------slider 6
                        value: _valueSlider6_torque.toDouble(),
                        min: 2.2,
                        max: 319.0,
                        //divisions: 10,
                        activeColor: Colors.lightBlueAccent,
                        inactiveColor: Colors.orange,
                        label: 'Set volume value',
                        onChanged: (double newValue) {
                          setState(() {
                            _valueSlider6_torque = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }


  // void getModelInformation(){
  //   var client = getClient();
  //   //List<int> inputBoundary = [];
  //   try{
  //     client.get(
  //         Uri.parse(FLASK_MODEL_URL_TEST)
  //     ). then((response){
  //       var decoded = json.decode(response.body);
  //       //list.add(decoded)
  //       // inputBoundary.add(decoded['displacement']['min']);     //index 0
  //       // inputBoundary.add(decoded['displacement']['max']);     //index 1
  //       //
  //       // inputBoundary.add(decoded['power']['min']);     //index 2
  //       // inputBoundary.add(decoded['power']['max']);     //index 3
  //       //
  //       // inputBoundary.add(decoded['torque']['min']);     //index 4
  //       // inputBoundary.add(decoded['torque']['max']);     //index 5
  //       //
  //       // inputBoundary.add(decoded['dry_weight']['min']);     //index 6
  //       // inputBoundary.add(decoded['dry_weight']['max']);     //index 7
  //       //
  //       // inputBoundary.add(decoded['wheelbase']['min']);     //index 8
  //       // inputBoundary.add(decoded['wheelbase']['max']);     //index 9
  //       //
  //       // inputBoundary.add(decoded['seat_height']['min']);     //index 10
  //       // inputBoundary.add(decoded['seat_height']['max']);     //index 11
  //
  //       //print(decoded['seat_height']);
  //       //print(list[10]);
  //       //print(list[11]);
  //     });
  //   } finally {
  //     client.close();
  //   }
  //   //print(decoded['seat_height']);
  //   // print(inputBoundary[10]);
  //   // print(inputBoundary[11]);
  //
  // }

  void getResponse(){
    var client = getClient();
    // Map<String, dynamic> request = {
    //   "message": "hello",
    //   "displacement" : 998,
    //   "power" : 191,
    //   "torque" : 103,
    //   "dry_weight" : 170,
    //   "wheelbase" : 1415,
    //   "seat_height" : 835,
    // };
    Map<String, dynamic> request = {
      "message": "hello",
      "displacement" : _valueSlider5_displacement,
      "power" : _valueSlider4_power,
      "torque" : _valueSlider6_torque,
      "dry_weight" : _valueSlider2_dryWeight,
      "wheelbase" : _valueSlider3_wheelbase,
      "seat_height" : _valueSlider1_seatHeight,
    };

    try{
      client.post(
          Uri.parse(FLASK_MODEL_URL_TEST),
          body: json.encode(request)
      ). then((response){
          var decoded = json.decode(response.body);
          //print(decoded['outcome']);
          print(response.body);
      });
    } finally {
      client.close();
    }
  }


  http.Client getClient(){
    return http.Client();
  }
}
