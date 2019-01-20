import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
import 'dart:io';
class ViewModel extends Model{
  FlashCard card;
  List<FlashCard> cards = [];
  void initializeCards(){
    for (int i = 1; i < 15; i++) {
        cards.add(FlashCard(File('assets/' + i.toString() + '.png')));
    }
  }
  void UpdateImage(File image){
    card = FlashCard(image);
    notifyListeners();
  }
}
