import 'dart:io';
import 'package:uofthacks/data/watson.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'package:quiver/iterables.dart';
import 'dart:math';

class FlashCard {
  String id;
  File image;
  String path;
 // Image im;
  var name;
  var words = [];
  List<double> scores = [];
  var bestWords;
  var conv;
  List<TranslationResult> translations = [];

  FlashCard(File image,{this.name, this.path,this.bestWords, this.conv}) {
    this.image = image;
    //this.generateWords();
  }  
  Future<void> generateWords() async{
    List<ClassResult> value = await visualRecognitionFile(this.image);
    print(value.runtimeType);

      value.forEach((item) {
        this.words.add(item.className);
        this.scores.add(item.score);
      });

    print(this.words.toString());
    print(this.scores.toString());

    this.maxScores(this.scores);
    await this.translateWords();
    

  }

  Future<void> translateWords() async {
    this.translations.add(await languageTranslator(this.bestWords[0]));
    this.translations.add(await languageTranslator(this.bestWords[1]));
    this.translations.add(await languageTranslator(this.bestWords[2]));
    this.translations.add(await languageTranslator(this.bestWords[3]));

    print(this.translations);
  }

  void maxScores(List<double> l) {
    List<int> ind = [];
    List<double> mx = [];
    for (int i = 0; i < l.length; i++) {
      if (ind.length < 4) {
        ind.add(i);
        mx.add(l[i]);
      }
      else if (mx[0] < l[i] && mx[1] < l[i] && mx[2] < l[i] && mx[3] < l[i]) {
        mx[mx.indexOf(min(mx))] = l[i];
        ind[mx.indexOf(min(mx))] = i;
      }

    }
    this.bestWords = [];
    this.bestWords.add(this.words[ind[0]]);
    this.bestWords.add(this.words[ind[1]]);
    this.bestWords.add(this.words[ind[2]]);
    this.bestWords.add(this.words[ind[3]]);

    print(this.bestWords);
  }

}