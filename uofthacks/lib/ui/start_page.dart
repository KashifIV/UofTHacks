import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/home_page.dart';
//import 'package:uofthacks/ui/login_page.dart';
//import 'package:uofthacks/domain/signup_page.dart';

class StartPage extends StatefulWidget{
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage>{
  Widget ButtonCreator(String title, Function press){
    return RaisedButton(
     color: Colors.cyan[600],
     elevation: 4.0, 
     splashColor: Colors.blueGrey[300],
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
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ButtonCreator('Login', () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()))),
                SizedBox(height: 20,),
                ButtonCreator('Signup', () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()))),
              ],
            ),
          ),
        ),
      );
    }
}