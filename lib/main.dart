import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool statusAnimation = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _playAnimation() {
    setState(() {
      statusAnimation = !statusAnimation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: statusAnimation ? 80 : 180,
              left: statusAnimation ? 10 : 30,
              right: 0,
              child: AnimatedDefaultTextStyle(
                curve: Curves.easeInCubic,
                style: TextStyle(
                    fontSize: statusAnimation ? 12 : 20, color: Colors.black),
                duration: const Duration(milliseconds: 500),
                child: Text(
                  'You have pushed the button this many times:',
                ),
              ),
            ),
            AnimatedPositioned(
              top: statusAnimation ? 100 : 260,
              left: statusAnimation ? 10 : 80,
              right: statusAnimation ? 40 : 70,
              duration: const Duration(milliseconds: 500),
              child: AnimatedContainer(
                width: statusAnimation ? 80 : 120,
                height: statusAnimation ? 40 : 80,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _playAnimation,
            tooltip: 'Increment',
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
