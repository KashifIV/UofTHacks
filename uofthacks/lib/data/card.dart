import 'dart:io';
import 'package:uofthacks/data/watson.dart';
class FlashCard {
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

/*
  void translateWords() {
    this.words.forEach((w) => translations.add(languageTranslator(w)));
  }
  */

}