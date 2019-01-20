import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/ui/verify_card.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/ui/card_view.dart';

class GenerateWords extends StatefulWidget {
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
  String hintText(ViewModel model) {
    if (model.state == PageState.valid){
      return model.card.bestWords[0];
    }
    else return 'Please enter the name of this photo';
  }
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ViewModel>( 
      builder: (context, child, model) => Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,  
        mainAxisAlignment: MainAxisAlignment.center,     
        children: <Widget>[
          new Container(
            padding: EdgeInsets.fromLTRB(30.0,0,30.0,0),
            child:ListTile(
            title: new TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: hintText(model)),
            ),
          )),
          new Container(
            padding: EdgeInsets.all(30.0),
            child:ListTile(
            title: new RaisedButton(
              child: new Text("Next"),
              color: Colors.yellow,
              onPressed: () {    
                model.UpdateCardName(_textController.text);       
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new VerifyCard(),
                );
                Navigator.of(context).push(route);
              },
            ),
          )),
        ],
      ),
    ));
  }
}
