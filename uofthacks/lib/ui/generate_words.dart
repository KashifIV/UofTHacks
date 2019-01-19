import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/ui/card_view.dart';

class GenerateWords extends StatefulWidget {
  File img;

  GenerateWords({Key key, @required this.img}) : super(key: key);

  _GenerateWords createState() => _GenerateWords();
}

class _GenerateWords extends State<GenerateWords> {
  var _textController = new TextEditingController();

  Widget showImage(ViewModel model) {
    if (model.card == null) {
      return Center(
          child: FlutterLogo(
        size: 100,
      ));
    } else
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Image.file(
          model.card.image,
          scale: 0.9,
          //width: 2,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Please enter the name of this photo'),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text("Next"),
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new CardView(name: _textController.text),
                );
                Navigator.of(context).push(route);
              },
            ),
          ),
          new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Image.file(
              widget.img,
              scale: 0.6,
              //width: 2,
            ),
          )
        ],
      ),
    );
  }
}
