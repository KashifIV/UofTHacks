import 'package:flutter/material.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/solo_play.dart';
class startOne extends StatelessWidget {
  
  startOne();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Image.asset('assets/player1.png'),
          Text(
            "Instructions for one player game: 1. Choose a card. 2. Compete with Watson and see how many words you can think up of that are the same. 3. Earn points for each word you match and earn your new best score!",
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
              onPressed:(){  Navigator.push(context, MaterialPageRoute(builder: (context)=> SoloPlay()));
          }
          
        ),
        ],
      ),
    ),
    );
  }
}