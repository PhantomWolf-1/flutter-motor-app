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

  void _goNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MySliderApp()));
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
      child: Container(
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

  void _goNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MySliderApp()));
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
  static const String FLASK_MODEL_URL =
      "https://motorcycle-model.herokuapp.com/";
  static const String FLASK_MODEL_URL_TEST = "http://127.0.0.1:5000";

  String prediction = "";
  Map featureValues = {};

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
      child: Container(
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
            title: Text('Flutter Slider page'),

          ),
          body: SingleChildScrollView(
              child: Center(
            //padding: EdgeInsets.all(0.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(25),
                        height: 800,
                        width: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "TEXT ABOUT THE PARAMETER AND WHAT WILL HAPPEN"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  //row 1-------------------
                                  children: [
                                    Text("Seat height: \t"),
                                    Slider(
                                      //-----------------------------slider 1
                                      value:
                                          _valueSlider1_seatHeight.toDouble(),
                                      min: 87.0,
                                      max: 919.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider1_seatHeight =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider1_seatHeight mm"),
                                    IconButton(
                                      //icon slider 1 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "This feature is about the height of the seat of a motorcycle, this is the space in milimeter from the groud to the seat.",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //row 2-------------------
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Dry weight: \t"),
                                    Slider(
                                      //-----------------------------slider 2
                                      value: _valueSlider2_dryWeight.toDouble(),
                                      min: 58.0,
                                      max: 562.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider2_dryWeight =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider2_dryWeight kg"),
                                    IconButton(
                                      //icon slider 2 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "This feature is all about the weight of a motorcycle. The dry weight means the weight of the bike without any fluids like oil and gas.",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //row 3-------------------
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Wheelbase: \t"),
                                    Slider(
                                      //-----------------------------slider 3
                                      value: _valueSlider3_wheelbase.toDouble(),
                                      min: 895.0,
                                      max: 2261.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider3_wheelbase =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider3_wheelbase mm"),
                                    IconButton(
                                      //icon slider 3 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "ABOUT THE WHEELBASE",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //row 4-------------------
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Horsepower: \t"),
                                    Slider(
                                      //-----------------------------slider 4
                                      value: _valueSlider4_power.toDouble(),
                                      min: 1.0,
                                      max: 417.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider4_power =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider4_power hp"),
                                    IconButton(
                                      //icon slider 4 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "About the power of the bike",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //row 5-------------------
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Displacement: \t"),
                                    Slider(
                                      //-----------------------------slider 5
                                      value:
                                          _valueSlider5_displacement.toDouble(),
                                      min: 49.0,
                                      max: 2575.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider5_displacement =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider5_displacement ccm"),
                                    IconButton(
                                      //icon slider 5 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "About the displacement of the bike",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //row 6-------------------
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Torgue: \t"),
                                    Slider(
                                      //-----------------------------slider 6
                                      value: _valueSlider6_torque.toDouble(),
                                      min: 2.0,
                                      max: 319.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider6_torque =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    Text("$_valueSlider6_torque Nm"),
                                    IconButton(
                                      //icon slider 6 -------------------------------------
                                      icon: ImageIcon(
                                          AssetImage('assets/help-icon.png')),
                                      tooltip: 'explain feature',
                                      onPressed: () {
                                        //getResponse();
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "About the torque of the bike",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  //Row for submit button
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        await getPrediction();
                                        print(prediction);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyPredictionPage( prediction: prediction, predFeatureValues: featureValues,)));
                                      },
                                      child: const Text("Predict!"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
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

  Future<void> getPrediction() async {
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
      "displacement": _valueSlider5_displacement,
      "power": _valueSlider4_power,
      "torque": _valueSlider6_torque,
      "dry_weight": _valueSlider2_dryWeight,
      "wheelbase": _valueSlider3_wheelbase,
      "seat_height": _valueSlider1_seatHeight,
    };

    //String predicted = "";
    var response = await client.post(Uri.parse(FLASK_MODEL_URL_TEST),
        body: json.encode(request));
    var decoded = json.decode(response.body);
    Map featureVal = {
      'displacement' : decoded['feature_values_prediction']['displacement'],
      'dry_weight' : decoded['feature_values_prediction']['dry_weight'],
      'power' : decoded['feature_values_prediction']['power'],
      'seat_height' : decoded['feature_values_prediction']['seat_height'],
      'torque' : decoded['feature_values_prediction']['torque'],
      'wheelbase' : decoded['feature_values_prediction']['wheelbase']
    };
    // featureValues['displacement'] = decoded['feature_values_prediction']['displacement'];
    // featureValues['dry_weight'] = decoded['feature_values_prediction']['dry_weight'];
    // featureValues['power'] = decoded['feature_values_prediction']['power'];
    // featureValues['seat_height'] = decoded['feature_values_prediction']['seat_height'];
    // featureValues['torque'] = decoded['feature_values_prediction']['torque'];
    // featureValues['wheelbase'] = decoded['feature_values_prediction']['wheelbase'];
    //print(featureVal);
    //print("----------------------------");
    var sortedByValueMap = Map.fromEntries(
        featureVal.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));

    //print(sortedByValueMap);

    setPredValue(decoded['outcome'], sortedByValueMap);
    //print(decoded);

    //try {
    //  client.post(Uri.parse(FLASK_MODEL_URL_TEST), body: json.encode(request)).then((response) {
    //    var decoded = json.decode(response.body);
    //    //predicted = decoded['outcome'];
    //    setPredValue(decoded['outcome']);
    //    //print(decoded['outcome']);
    //    //print(response.body);
    //  });
    //} finally {
    //  client.close();
    //}
  }

  void setPredValue(String pred, Map featureV) {
    print("prediction value in method: ");
    print(pred);
    prediction = pred;
    featureValues = featureV;
  }

  http.Client getClient() {
    return http.Client();
  }
}

class MyPredictionPage extends StatefulWidget {
  const MyPredictionPage({super.key, required this.prediction, required this.predFeatureValues});

  final String prediction;
  final Map predFeatureValues;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyPredictionPage> createState() => _MyPredictionPage();
}

class _MyPredictionPage extends State<MyPredictionPage> {
  void _goNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MySliderApp()));
  }

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
      child: Container(
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
            title: Text('Prediction Motorcycle Type'),
          ),
          body: SingleChildScrollView(
            child: Center(
              //padding: EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.all(25),
                            height: 800,
                            width: 1000,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                Text("Predicted motorcycle type:", textScaleFactor: 2.0,),
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                Text("${widget.prediction}", textScaleFactor: 2.5, style: TextStyle(fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.all(30.0),
                                ),
                                Text("Explanation on the prediction", textScaleFactor: 1.0, style: TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                        children: [
                                          Text("TEXT AS EXPLINATION OF THE MODEL AND ITS FEATURES", textScaleFactor: 1.0, style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),

                                    Container(
                                      color: Colors.lightBlueAccent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Features which increased or lowered this prediction:", textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                                          getTextWidgetForFeature(0),
                                          getTextWidgetForFeature(1),
                                          getTextWidgetForFeature(2),
                                          getTextWidgetForFeature(3),
                                          getTextWidgetForFeature(4),
                                          getTextWidgetForFeature(5),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: _goNextPage,
            tooltip: 'Home',
            child: const Icon(Icons.home),
          ),
        ),
      ),
    );
  }

  Text getTextWidgetForFeature(int numbOfFeature){
    String txt = "$numbOfFeature";
    String keyOfFeature = widget.predFeatureValues.keys.elementAt(numbOfFeature);
    txt = "${txt}. $keyOfFeature";
    Color c;
    print(widget.predFeatureValues[keyOfFeature]);
    if(widget.predFeatureValues[keyOfFeature] < 0.0){
      c = Colors.redAccent;
    } else{
      c = Colors.lightGreenAccent;
    }
    print(c.value);
    return Text(txt, style: TextStyle(color: c));
  }


}
