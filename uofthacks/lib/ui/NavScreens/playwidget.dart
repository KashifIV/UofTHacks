import 'package:flutter/material.dart';
import 'package:uofthacks/ui/start_one_player.dart';
import 'package:uofthacks/ui/start_two_player.dart';

class PlayWidget extends StatelessWidget {

 PlayWidget();

 @override
 Widget build(BuildContext context) {
   return Container(
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget> [
        new Expanded(
        child: new GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> startOne()));
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/solo1.png'),
                fit: BoxFit.fill,
              ),
          ),
          ),
        ),
        ),
        new Expanded(
        child: new GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> startTwo()));
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/multi.jpg'),
                fit: BoxFit.fill,
              ),
          ),
        ),
        ),
        ),
       ],
     ),
   );
 }
}