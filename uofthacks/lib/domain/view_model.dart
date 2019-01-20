import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/data/database.dart';
import 'package:flutter/material.dart';
import 'dart:io';
enum PageState{
  valid, loading, failed
}
class ViewModel extends Model{
  String uid;
  String docId;
  FlashCard card;
  String language, difficulty;
  List<FlashCard> cards = [];
  PageState cardState = PageState.loading;
  PageState initState = PageState.loading;
  List<String> paths = [];
  
  void initializeCards(){
    for (int i = 1; i < 15; i++) {
      //default cards
        cards.add(FlashCard(new File('assets/' + i.toString() + '.jpg'),name: 'something',)..generateWords());
        paths.add('assets/' + i.toString() + '.jpg');
    }
    notifyListeners();
  }
  void UpdateImage(File image){
    card = FlashCard(image);
    notifyListeners();
  }
  void clear(){
    //card = null;
    cardState = PageState.loading;
    notifyListeners();
  }

  void updateDifficulty(String dif){
    difficulty = dif;
    notifyListeners();
  }

  void updateLanguage(String lang){
    language = lang;
    notifyListeners();
  }

  void UpdateCardName(String name) {
    this.card.name = name;
    notifyListeners();
  }
  void UpdateState(PageState state, bool init){
    if (init)  this.initState = state;
    else this.cardState = state;
    notifyListeners();
  }
  void SetCard(FlashCard card){
    this.card = card;
    cardState = PageState.valid;
    notifyListeners();
  }
  Future<void> InitializeCard() async{
    if (card.conv != null) return;
    await card.generateWords();
    cardState = PageState.valid;
    notifyListeners();
  }
  void AddCard(){
    cards.add(card);
    CreateFlashCard(docId, card);
    print(cards.toString());
    notifyListeners();
  }
  Future<void> CheckAddUser(String id) async{
    this.uid = id;
    print('part1');
    List<String> val = await GetUser(id);
    if (val[0] != 'None'){
      this.initState = PageState.valid;
      language = val[0];
      docId = val[1];
      cards.addAll(await GetFlashCards(docId));
      print('-----------------');
      print(cards.length.toString());
      //initializeCards();
      notifyListeners();
      return;
    }
    //WRITE A PAGE TO ASK FOR LANGUAGE PREFERENCE
    docId = await CreateNewUser(id, 'French');
    this.initState = PageState.valid;
    initializeCards();
    notifyListeners();    

  }

}
