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

class GenerateWords extends StatelessWidget {
  var _textController = new TextEditingController();

  String hintText(ViewModel model) {
    return 'Please enter the name of this photo';
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
                  hintText: 'Please enter the name of this photo'),
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
          ),
         
          )
        ],
      ),
    ));
  }
}
