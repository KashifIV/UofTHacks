import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/data/database.dart';
import 'dart:io';
class ViewModel extends Model{
  String uid;
  FlashCard card;
  List<FlashCard> cards = [];
  PageState state = PageState.loading;
  void initializeCards(){
    
  }
  void UpdateImage(File image){
    card = FlashCard(image);
    notifyListeners();
  }
  void UpdateCardName(String name) {
    this.card.name = name;
    notifyListeners();
  }
  void UpdateState(PageState state){
    this.state = state;
    notifyListeners();
  }
  Future<void> InitializeCard() async{
    await card.generateWords();
    state = PageState.valid;
    notifyListeners();
  }
  void AddCard(){
    CreateFlashCard(uid, card);
  }
}
enum PageState{
  valid, loading, failed
}