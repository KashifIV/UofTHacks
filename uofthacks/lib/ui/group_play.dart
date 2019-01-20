import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/card_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'dart:io';
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:math';

class GroupPlay extends StatelessWidget {
  int _currentIndex = 0;
  //timer
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => Scaffold(
        body: CardView(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: (){
            print(model.cards[_currentIndex]);
            counter++;
            _currentIndex++;
            model.SetCard(model.cards[_currentIndex]);
          },
        ),
      ),
    );
  }
}


