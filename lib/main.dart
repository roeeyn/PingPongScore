import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              ScoreColumn(
                username: "Player 1",
                playerId: 1,
              ),
              ScoreColumn(
                username: "Player 2",
                playerId: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreColumn extends StatefulWidget {
  ScoreColumn({Key key, this.username, this.playerId}) : super(key: key);
  final String username;
  final int playerId;

  @override
  _ScoreColumnState createState() => _ScoreColumnState();
}

class _ScoreColumnState extends State<ScoreColumn> {
  int _score = 0;

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: (widget.playerId % 2 == 0) ? Colors.blue : Colors.green,
        child: InkWell(
          onTap: _incrementScore,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(
                    widget.username,
                    style: TextStyle(fontSize: 32),
                  )),
              Container(
                child: Expanded(
                    child: Center(
                        child: Text(
                  "$_score",
                  style: TextStyle(fontSize: 48),
                ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
