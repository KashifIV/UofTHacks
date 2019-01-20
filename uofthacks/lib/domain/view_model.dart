import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
<<<<<<< HEAD
import 'package:uofthacks/data/database.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> 6760eb90d4bf23da34af7f3c9c3a0f3ded599e5f
import 'dart:io';
class ViewModel extends Model{
  String uid;
  String docId;
  FlashCard card;
  String language, difficulty;
  List<FlashCard> cards = [];
<<<<<<< HEAD
  PageState cardState = PageState.loading;
  PageState initState = PageState.loading;
  void initializeCards(){
    
=======
  List<String> paths = [];
  void initializeCards(){
    for (int i = 1; i < 15; i++) {
<<<<<<< HEAD
      //default cards
        cards.add(FlashCard(new File('assets/' + i.toString() + '.jpg')));
        paths.add('assets/' + i.toString() + '.jpg');
=======
        cards.add(FlashCard(File('assets/default/' + i.toString() + '.jpg')));
>>>>>>> 95777d3b17fc824b2ad821f4b3d9c5403405d281
    }
>>>>>>> 6760eb90d4bf23da34af7f3c9c3a0f3ded599e5f
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
      notifyListeners();
      return;
    }
    //WRITE A PAGE TO ASK FOR LANGUAGE PREFERENCE
    docId = await CreateNewUser(id, 'French');
    this.initState = PageState.valid;
    notifyListeners();    

  }
}
enum PageState{
  valid, loading, failed
}