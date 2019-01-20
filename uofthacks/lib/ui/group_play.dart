import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'dart:io';
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:math';

class GroupPlay extends StatelessWidget {
  int _currentIndex = 0;
  //timer

  @override
  Widget build(BuildContext context) {
    //return Scaffold(
    return Container(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> TwoPlayerPage()));
              },
              child: //Container(
                  new Container(
                height: 500.0,
                width: 120.0,
                decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    //shape: BoxShape.circle,
                    // ),
                    // )
                    //    padding: EdgeInsets.all(12.0),
                    //    decoration: new BoxDecoration(
                    color: Colors.white
                    //image: DecorationImage(
                    //  image: new AssetImage('assets/PICBEE(1).png'),
                    //  fit: BoxFit.fill,
                    //),
                    ),
              ),
            ),
          ),
          new Expanded(
            child: new GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> TwoPlayerPage()));
              },
              //child: Container(
              //  padding: EdgeInsets.all(12.0),
              // decoration: new BoxDecoration(
              //  image: DecorationImage(
              //  image: new AssetImage('assets/PICBEE(2).png'),
              // fit: BoxFit.fill,
              // ),
              //  ),
              //  ),
            ),
          ),
        ],
      ),
    );
  }
}

void nextIm() {}
