import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
class SoloPlay extends StatelessWidget {
  SoloPlay();
  int _currentIndex = 0;
  int _numRight = 0;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(builder: (context, child, model) =>
              Container(
                child: Column(
                  children: <Widget>[
                   Row(
                    children: <Widget>[
            Text("Number of attempts left: $_currentIndex", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            Text("Score: $_numRight", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                    ],
                  ),
              Image.file(model.card.image),
              TextField(controller: myController), 
              FloatingActionButton(
                onPressed:(){
                  updateScore(myController.text, model);
                  },
                  ),
                  ],
                ),
              ),
    );
  }
  void updateScore(String txt, ViewModel model)
  {
    for(int i =0; i < 5; i++){
      if(txt = model.card.bestWords[i]){
        _numRight++;
        model.card.bestWords.removeAt(i);
        return;
      }
    }
    _currentIndex--;
  }
}