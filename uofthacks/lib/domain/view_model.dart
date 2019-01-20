import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class ViewModel extends Model{
  FlashCard card;
  List<FlashCard> cards = [];
  List<String> paths = [];
  void initializeCards(){
    for (int i = 1; i < 15; i++) {
      //default cards
        cards.add(FlashCard(new File('assets/' + i.toString() + '.jpg')));
        paths.add('assets/' + i.toString() + '.jpg');
    }
  }
  void UpdateImage(File image){
    card = FlashCard(image);
    notifyListeners();
  }
}
