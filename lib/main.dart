import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
      title: 'Motor type predictor',
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
      home: const TestPage(title: 'Motor type predictor'),
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
            title: Text('Motor type predictor'),
          ),
          body: SingleChildScrollView(
            child: Center(
              //padding: EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(25),
                          width: 1000,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                              ),
                              SizedBox(
                                width: 500,
                                child: Text("Motorcycle type predictor",
                                    textScaleFactor: 3,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                              ),
                              SizedBox(
                                width: 900,
                                child: Text(
                                  "Hi there! There are a lot of motorcycles out there. Each of them are different in size, different in power and name it. These features are specifications under a type of motorcycle! For example: Naked bikes.\n"
                                  "This application is all about predicting a type of motorcycle based on a few features you can put in yourself! \n\n"
                                  "So, do you want to know which type of motorcycle would fit your specifications? Well go ahead and try it!",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 50.0),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(240, 80),
                                    backgroundColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                    )),
                                onPressed: _goNextPage,
                                child: const Text('To prediction!'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(25),
                          width: 1000,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 20.0)),
                              SizedBox(
                                width: 500,
                                child: Text("How does this application works?",
                                    textScaleFactor: 3,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10.0)),
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20.0)),
                                  SizedBox(
                                    width: 800,
                                    child: Text(
                                          "This application makes its prediction through Artificial Intelligence(AI) which used a dataset, with around 4000 samples, based on different motorcycles and there specifications. The specific features, the specifications, used in this application are: the dry weight, the seat height, the wheelbase, the power, the displacement and the torque of a motorcycle. Each feature has its own importance within the prediction, tis is described in the figure below.",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                                  Image.asset('assets/feature_importances.png'),
                                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                                  SizedBox(
                                    width: 800,
                                    child: Text(
                                      "For example, the top three features which have the most impact in the prediction based on the dataset are dry weight, seat height and wheelbase. Each feature is explaind in the input window where the prediction will be made.",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 30.0),),
                                  SizedBox(
                                    width: 800,
                                    child: Text(
                                      "There are a lot more motorcycles out there, so before hand: this model is pretty accurate but is not perfect, there is a small chance that the model can make a wrong prediction. Privacy disclaimer: nothing in this application will be saved.",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
            title: Text('Motor type predictor'),
          ),
          body: SingleChildScrollView(
            child: Center(
              //padding: EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(25),
                          width: 650,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Text("TESTING"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
            title: Text('Motor type predictor'),
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
                        width: 650,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            SizedBox(
                              width: 500,
                              child: Text("Input for the prediction",
                                  textScaleFactor: 3,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            SizedBox(
                              width: 500,
                              child: Text(
                                "The input for making a prediction on a motorcycle type will be taken on this page. There are sliders which can slide left and right to give a certain meassurement or specific value to each feature below. After all the values are as wish, the button underneath all the sliders which says 'Predict' can be pressed to start the prediction!",
                                textScaleFactor: 1.5,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 40.0)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  //row 1-------------------
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Seat height:",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 1
                                      value:
                                          _valueSlider1_seatHeight.toDouble(),
                                      min: 87.0,
                                      max: 919.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider1_seatHeight =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider1_seatHeight mm",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "This feature is about the height of the seat of a motorcycle, this is the space in millimeter from the groud to the seat. So the higher this value, the higher the motorcycle is going to be.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Dry weight:",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 2
                                      value: _valueSlider2_dryWeight.toDouble(),
                                      min: 58.0,
                                      max: 562.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider2_dryWeight =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider2_dryWeight kg",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "This feature is all about the weight of a motorcycle in kilograms. The dry weight means the weight of the bike without any fluids like oil and gas.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Wheelbase:",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 3
                                      value: _valueSlider3_wheelbase.toDouble(),
                                      min: 895.0,
                                      max: 2261.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider3_wheelbase =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider3_wheelbase mm",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "Wheelbase means the horizontal distance between the center of the front and rear axles. The higher this value, the longer the motorcycle is going to be.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Horsepower: ",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 4
                                      value: _valueSlider4_power.toDouble(),
                                      min: 1.0,
                                      max: 417.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider4_power =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider4_power hp",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "This feature represents the power a motorcycle has, this value is in horsepower(hp)",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Displacement: ",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 5
                                      value:
                                          _valueSlider5_displacement.toDouble(),
                                      min: 49.0,
                                      max: 2575.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider5_displacement =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider5_displacement ccm",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "The displacement is a way to measure the volume of the cylinders of a motorcycle. Basically, displacement measures the amount of space that the engine;s pistons sweep within one stroke. the more displacement it has, the more powerful an engine is.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Torque:",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
                                    Slider(
                                      //-----------------------------slider 6
                                      value: _valueSlider6_torque.toDouble(),
                                      min: 2.0,
                                      max: 319.0,
                                      //divisions: 10,
                                      activeColor: Colors.lightBlueAccent,
                                      inactiveColor: Colors.orange,
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _valueSlider6_torque =
                                              newValue.round();
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "$_valueSlider6_torque Nm",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.0,
                                      ),
                                    ),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                  ),
                                                  SizedBox(
                                                    width: 500,
                                                    child: Text(
                                                      "Torque is the rotational force that is available at the wheels. In other words, it is the amout of force or twiting force that is available at the wheels to propel the bike further. The higher the torque value, the more powerful the rotational force is of the wheels.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      textScaleFactor: 1.5,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        bottom: 10.0),
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
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                ),
                                Row(
                                  //Row for submit button
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(240, 80),
                                          backgroundColor: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          textStyle: const TextStyle(
                                            fontSize: 22,
                                          )),
                                      onPressed: () async {
                                        await getPrediction();
                                        print(prediction);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyPredictionPage(
                                                      prediction: prediction,
                                                      predFeatureValues:
                                                          featureValues,
                                                    )));
                                      },
                                      child: const Text("Predict!"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 20.0, left: 20.0, right: 20.0)),
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
      'displacement': decoded['feature_values_prediction']['displacement'],
      'dry_weight': decoded['feature_values_prediction']['dry_weight'],
      'power': decoded['feature_values_prediction']['power'],
      'seat_height': decoded['feature_values_prediction']['seat_height'],
      'torque': decoded['feature_values_prediction']['torque'],
      'wheelbase': decoded['feature_values_prediction']['wheelbase']
    };
    // featureValues['displacement'] = decoded['feature_values_prediction']['displacement'];
    // featureValues['dry_weight'] = decoded['feature_values_prediction']['dry_weight'];
    // featureValues['power'] = decoded['feature_values_prediction']['power'];
    // featureValues['seat_height'] = decoded['feature_values_prediction']['seat_height'];
    // featureValues['torque'] = decoded['feature_values_prediction']['torque'];
    // featureValues['wheelbase'] = decoded['feature_values_prediction']['wheelbase'];
    //print(featureVal);
    //print("----------------------------");
    var sortedByValueMap = Map.fromEntries(featureVal.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));

    //print(sortedByValueMap);

    setPredValue(decoded['outcome'], sortedByValueMap);
    print(decoded);
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
  const MyPredictionPage(
      {super.key, required this.prediction, required this.predFeatureValues});

  final String prediction;
  final Map predFeatureValues;

  @override
  State<MyPredictionPage> createState() => _MyPredictionPage();
}

class _MyPredictionPage extends State<MyPredictionPage> {
  void _goNextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const TestPage(title: 'Motor type predictor')));
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
            title: Text('Motor type predictor'),
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
                                Text(
                                  "Predicted motorcycle type:",
                                  textScaleFactor: 2.5,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                Text("${widget.prediction}",
                                    textScaleFactor: 3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.all(30.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                            "This prediction is based on the features you put in. There is a visualisation on the right of which feature has the most impact on the prediction, the features are ordered from the highest value of impact to features which gave the least effect towards the prediction of ${widget.prediction}.\n\n\n",
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                              "Summary of the vizualisation:\n ",
                                              textScaleFactor: 1.5,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                            "- ${getStringAboutFeature(0)} \n\n"
                                            "- ${getStringAboutFeature(1)} \n\n"
                                            "- ${getStringAboutFeature(2)} \n\n"
                                            "- ${getStringAboutFeature(3)} \n\n"
                                            "- ${getStringAboutFeature(4)} \n\n"
                                            "- ${getStringAboutFeature(5)} \n\n\n",
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                            "${getFinalStoryOfBikeType()} \n",
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                            "The same type of motorcycles could have different measurements, even the slightest difference could be noticable. But if this type sounds great, have a look at the nearest motorcycle dealer and try some of them to settle the deal!",
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Features which increased or lowered this prediction:",
                                            textScaleFactor: 1.2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(0),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(1),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(2),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(3),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(4),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        getTextWidgetForFeature(5),
                                      ],
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
          // floatingActionButton: FloatingActionButton(
          // //onPressed: _incrementCounter,
          // onPressed: _goNextPage,
          // tooltip: 'Home',
          // child: const Icon(Icons.home),
          // ),
        ),
      ),
    );
  }

  String getFinalStoryOfBikeType() {
    String txt = "";

    switch (widget.prediction) {
      case "Custom / cruiser":
        txt =
            "Cruisers are typically long of length, heavy and have a pretty low seat height (which means its easier to set a foot on the ground).  Cruisers are mostly used for long trips because it is very comfortable to ride for a long trip, but it is not meant to ride short distances and for offroad riding.";
        break;

      case "Naked bike":
        txt =
            "Naked Bikes are relatively short and have a relatively average seat height. They are great for riding inside or outside the city and are still comfortable on longer rides. Basically a good allround type of bike, except for offroad trips!";
        break;

      case "Sport":
        txt =
            "Sport bikes are typically the kind of 'racer' type. They are very light compaired to their massive displacement value and are mostly streamlined to minimize the hindrance of air. These bikes are not meant for long strips due to the way of the position a rider has to sit, but they can be fun for little (and fast) trips.";
        break;

      case "Touring":
        txt =
            "Touring bikes are the bikes for traveling. They have some power in them and are not heavy nor to light, they have a average seat height and are comfortable to drive long distances. These bikes can be used like an allround bike, except for going offroad.";
        break;
    }
    return txt;
  }

  String getStringAboutFeature(int featureOfList) {
    String txt = "";
    String keyOfFeature =
        widget.predFeatureValues.keys.elementAt(featureOfList);
    txt = "$keyOfFeature";
    if (widget.predFeatureValues[keyOfFeature] < 0.0) {
      if (featureOfList == 1) {
        txt =
            "${txt} had a negative impact on the prediction of a ${widget.prediction}, but still was the highest impact towards the predicted motorcycle type.";
      } else if (featureOfList == 5) {
        txt =
            "${txt} had the most negative impact on the prediction of a ${widget.prediction}.";
      } else {
        txt =
            "${txt} had a negative impact on the prediction of a ${widget.prediction}.";
      }
    } else {
      if (featureOfList == 0) {
        txt =
            "${txt} had the most positive impact on the prediction of a ${widget.prediction}.";
      } else if (featureOfList == 5) {
        txt =
            "${txt} had the least impact on the prediction of a ${widget.prediction}, but was still a positive impact towards the predicted motorcycle type.";
      } else {
        txt =
            "${txt} had a positive impact on the prediction of a ${widget.prediction}.";
      }
    }
    return txt;
  }

  Chip getTextWidgetForFeature(int numbOfFeature) {
    String txt = " ";
    String keyOfFeature =
        widget.predFeatureValues.keys.elementAt(numbOfFeature);
    txt = "${txt}$keyOfFeature";
    Color c;
    print(widget.predFeatureValues[keyOfFeature]);
    if (widget.predFeatureValues[keyOfFeature] < 0.0) {
      c = Colors.redAccent;
    } else {
      c = Colors.lightGreenAccent;
    }
    print(c.value);
    return Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.white70,
          child: Text("${numbOfFeature + 1}"),
        ),
        backgroundColor: c,
        elevation: 6.0,
        label: Text(txt),
        padding: EdgeInsets.all(10.0));
  }
}
