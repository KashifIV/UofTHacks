import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/card_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'dart:io';
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/end_page.dart';
import 'dart:math';

class GroupPlay extends StatelessWidget {
  int _currentIndex = 0;
  //timer
  int counter = 0;
  void End(BuildContext context){
    if (_currentIndex > 8){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>EndPage(counter)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => Scaffold(
        body: CardView(),
        
        bottomNavigationBar: new BottomAppBar(
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
                IconButton(icon: Icon(Icons.check), onPressed: (){
                   counter++;
                   _currentIndex++;
                   End(context);
                    model.SetCard(model.cards[_currentIndex]);
                }),
                IconButton(icon: Icon(Icons.error), onPressed: () {
                  _currentIndex++;
                  End(context);
                    model.SetCard(model.cards[_currentIndex]);
                    
                },),
              ],
            ),
          ),
      ),
    );
  }
}


