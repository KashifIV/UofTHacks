import 'dart:io';
import 'package:uofthacks/data/watson.dart';
class FlashCard {
  File image;
  var words;

  FlashCard(File image) {
    this.image = image;
    this.generateWords();
    
    //this.words = words;
  }  

  void generateWords() {
    visualRecognitionFile(this.image);
  }

}