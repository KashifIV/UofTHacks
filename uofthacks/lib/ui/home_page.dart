import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/data/auth.dart';
import 'package:uofthacks/domain/test_model.dart';
import 'package:uofthacks/ui/test_page.dart';
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/ui/list_card.dart';

class HomePage extends StatefulWidget{
  final Auth auth;
  final VoidCallback onSignedOut;
  HomePage({this.auth, this.onSignedOut});
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  Widget ButtonCreator(String title, Function press){
    return RaisedButton(
     color: Colors.amber[800],
     shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
     onPressed: press,
     child: Container(
       height: 40,
       width: 230,
       child: Text(
         title,
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.white,
           fontSize: 30,
         ),
       ),
     ),
     padding: EdgeInsets.all(20.0),
   );
  }
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
          backgroundColor: Colors.grey[800],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ButtonCreator('Solo Play', () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TwoPlayerPage()))),
                SizedBox(height: 20,),
                ButtonCreator('Group Play', () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TwoPlayerPage()))),
                SizedBox(height: 20,),
                ButtonCreator('Make Cards', () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MakeCard()))),
                SizedBox(height: 20,),
                ButtonCreator('Developer Mode', () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> CardList()))),
              ],
            ),
          ),
        ),
      );
    }
}