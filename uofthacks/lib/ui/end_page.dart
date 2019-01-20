import 'package:flutter/material.dart';

class EndPage extends StatelessWidget{
  final int counter;
  EndPage(this.counter);
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Congratulations! Your score is'),
              Text(counter.toString())
            ],
          ),
        ),
      );
    }
}