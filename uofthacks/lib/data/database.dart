import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:uofthacks/data/card.dart';
import 'dart:io';

Future<String> CreateNewUser(String id, String lang) async{
  DocumentReference ref;
  await Firestore.instance.runTransaction((transaction)async{
    ref = Firestore.instance.collection('users').document();
    await transaction.set(ref, mapToUser(id, lang));
    return ref.documentID;
  });
}
Map<String, dynamic> mapToUser(String id, String lang){
    var dataMap = new Map<String, dynamic>();
    dataMap['uid'] = id;
    dataMap['language'] = lang;
    return dataMap;
  }
Future<List<String>> GetUser(String id)async{
  print('part2');
  QuerySnapshot snapshot = await Firestore.instance.collection('users')
    .where('uid', isEqualTo: id)
    .getDocuments();
    print('part 3');
    print(snapshot.documents.toString());
    if (snapshot.documents.isEmpty){
      return ['None'];
    };
    return [snapshot.documents[0]['language'],snapshot.documents[0].documentID];
}
Future<void> CreateFlashCard(String id, FlashCard card)async{
  //Firestore.instance.collection('users/' + id + '/flashcards').document();
  
  await Firestore.instance.runTransaction((transaction) async{
    CollectionReference a = Firestore.instance.collection('users/' + id + '/flashcard');
    DocumentReference ref = a.document();
    card.id = ref.documentID;
    await transaction.set(ref, mapToFlash(card));
    print('Added a new Flash Card');
  });
  
}
Map<String, dynamic> mapToFlash(FlashCard card){
  var dataMap = new Map<String, dynamic>();
    dataMap['image'] = card.image.uri.toString();
    dataMap['translations'] = card.translations.toString();
    dataMap['native'] = card.bestWords.toString();
    return dataMap;
}
Future<void> DeleteFlashCard(String id, FlashCard card)async{
  CollectionReference a = Firestore.instance.collection('users/' + id + '/flashcard');
  await a.document(card.id).delete();
}
Future<List<FlashCard>> GetFlashCards(String id)async{
  CollectionReference a = Firestore.instance.collection('users/' + id + '/flashcard');
    QuerySnapshot s = await a.getDocuments(); 
    print(s.documents.length);
    List<FlashCard> t = []; 
    s.documents.forEach((task){
      if (task.exists){
          t.add(new FlashCard(File(task['image']), bestWords: task['native'], conv: task['translations']));
      }
    }); 
    return t;
}