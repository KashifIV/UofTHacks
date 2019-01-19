import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:uofthacks/data/card.dart';

Future<void> CreateNewUser(String id, String lang) async{
  DocumentReference ref;
  Firestore.instance.runTransaction((transaction)async{
    ref = Firestore.instance.collection('users').document();
    await transaction.set(ref, mapToUser(id, lang));
  });
}
Map<String, dynamic> mapToUser(String id, String lang){
    var dataMap = new Map<String, dynamic>();
    dataMap['uid'] = id;
    dataMap['language'] = lang;
    return dataMap;
  }
Future<String> GetUser(String id)async{
  QuerySnapshot snapshot = await Firestore.instance.collection('users')
    .where('userid', isEqualTo: id)
    .getDocuments();
    return snapshot.documents[0]['language'];
}
Future<void> CreateFlashCard(String id, FlashCard card)async{
  await Firestore.instance.runTransaction((transaction) async{
    CollectionReference a = Firestore.instance.collection('users/' + id + '/flashcards');
    DocumentReference ref = a.document();
    card.id = ref.documentID;
    await transaction.set(ref, mapToFlash(card));
  });
}
Map<String, dynamic> mapToFlash(FlashCard card){
  var dataMap = new Map<String, dynamic>();
    dataMap['image'] = card.image.uri;
    dataMap['translations'] = card.translations;
    dataMap['native'] = card.words;
    return dataMap;
}
Future<void> DeleteFlashCard(String id, FlashCard card)async{
  CollectionReference a = Firestore.instance.collection('users/' + id + '/flashcards');
  await a.document(card.id).delete();
}