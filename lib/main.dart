import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flare Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flare Animation Tutorial'),
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
  String _animationName = '';
  bool _isPaused = false;

  void _changeAnimation(String status) {
    setState(() {
      _isPaused = false;
      _animationName = status;
    });
  }

  void _stopAnimation() {
    setState(() {
      _animationName = '';
      _isPaused = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
            child: FlareActor(
              'assets/Minion.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              isPaused: _isPaused,
              animation: _animationName,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Stand'),
                onPressed: () => _changeAnimation('Stand'),
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                child: Text('Dance'),
                onPressed: () => _changeAnimation('Dance'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Jump'),
                onPressed: () => _changeAnimation('Jump'),
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                child: Text('Wave'),
                onPressed: () => _changeAnimation('Wave'),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Stop Animation'),
            onPressed: () => _stopAnimation(),
          ),
        ],
      ),
    );
  }
}
