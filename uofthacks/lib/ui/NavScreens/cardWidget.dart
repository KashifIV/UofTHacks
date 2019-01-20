import 'package:flutter/material.dart';
import 'package:uofthacks/ui/two_player_page.dart';
<<<<<<< HEAD
import 'package:uofthacks/ui/make_card.dart';
=======
import 'package:uofthacks/ui/list_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';

>>>>>>> 6760eb90d4bf23da34af7f3c9c3a0f3ded599e5f
class cardWidget extends StatelessWidget {

 cardWidget();

 @override
 Widget build(BuildContext context) {
   return Container(
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget> [
        new Expanded(
        child: new GestureDetector(
          onTap: () {
            ScopedModel.of<ViewModel>(context).initializeCards();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CardList()));
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/PICBEE(1).png'),
                fit: BoxFit.fill,
              ),
          ),
          ),
        ),
        ),
        new Expanded(
        child: new GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeCard()));
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/PICBEE(2).png'),
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