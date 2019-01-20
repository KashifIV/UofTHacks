import 'package:flutter/material.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/ui/group_play.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';

class startTwo extends StatelessWidget {
  
  startTwo();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Image.asset('assets/player2.png'),
          Text(
            "Instructions for multiplayer game: 1. Try to describe the word at the top of the card without saying that word or the other 4 words. 2. The other players will try to guess the word If they guess it correctly, press the check button. If they guess it incorrectly, press the X button. 3. Earn points for each word people guess right!",
            textAlign: TextAlign.center,
            
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          SizedBox(height: 20,),
          new MaterialButton(
          child: new Text('Start',
              style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
              color: Colors.yellow,
              height: 80,
              minWidth: 200,
              onPressed:(){  Navigator.push(context, MaterialPageRoute(builder: (context){
                ScopedModel.of<ViewModel>(context).UpdateState(PageState.valid, false);
                ScopedModel.of<ViewModel>(context).SetCard(ScopedModel.of<ViewModel>(context).cards[0]);
                return GroupPlay();}));
          }
          
        ),
        ],
      ),
    ),
    );
  }
}