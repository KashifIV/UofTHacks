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
        cards.add(FlashCard(new File('assets/' + i.toString() + '.jpg')));
        paths.add('assets/' + i.toString() + '.jpg');
    }
    
  }
  void UpdateImage(File image){
    card = FlashCard(image);
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
  Future<void> InitializeCard() async{
    await card.generateWords();
    cardState = PageState.valid;
    notifyListeners();
  }
  void AddCard(){
    CreateFlashCard(docId, card);
  }
  Future<void> CheckAddUser(String id) async{
    this.uid = id;
    print('part1');
    List<String> val = await GetUser(id);
    if (val[0] != 'None'){
      this.initState = PageState.valid;
      language = val[0];
      docId = val[1];
      cards.addAll(await GetFlashCards(docId)); ///////////////////////
      print('-----------------');
      print(cards.length.toString());
      notifyListeners();
      return;
    }
    //WRITE A PAGE TO ASK FOR LANGUAGE PREFERENCE
    docId = await CreateNewUser(id, 'French');
    this.initState = PageState.valid;
    notifyListeners();    

  }
}
