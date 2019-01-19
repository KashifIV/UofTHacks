import 'dart:io';
import 'package:uofthacks/data/watson.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';

class FlashCard {
  File image;
  var words = [];
  var scores = [];
  List<dynamic> translations;

  FlashCard(File image) {
    this.image = image;
    this.generateWords();
    //this.translateWords();
  }  

  void generateWords() {
    visualRecognitionFile(this.image).then((value) { 
      print(value.runtimeType);
      //this.words = value;
      //this.words = value;
      //this.words = ClassResult
      
      /*
      for (int i = 0; i < 3; i++) {
        this.words.add(value[i].className);
        this.scores.add(value[i].score);
      }
      */

      value.forEach((item) {
        this.words.add(item.className);
        this.scores.add(item.score);
      });

      

      print(this.words.toString());
      print(this.scores.toString());
    });


    //translateWords();
  }

  void translateWords() {
    this.words.forEach((w) => translations.add(languageTranslator(w)));
    print(this.words);
    print(this.translations);
  }
  

}