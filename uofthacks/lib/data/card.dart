import 'dart:io';
import 'package:uofthacks/data/watson.dart';
class FlashCard {
  String id;
  File image;
  var words;
  var translations;

  FlashCard(File image) {
    this.image = image;
    this.generateWords();
    //this.translateWords();
  }  

  void generateWords() {
    this.words = visualRecognitionFile(this.image);
  }
  Map<String, dynamic> mapTo(String id, String lang){
    var dataMap = new Map<String, dynamic>();
    dataMap['uid'] = id;
    dataMap['language'] = lang;
    return dataMap;
  }
/*
  void translateWords() {
    this.words.forEach((w) => translations.add(languageTranslator(w)));
  }
  */

}