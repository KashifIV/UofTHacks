import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/two_player_page.dart';
class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    '1 Player!',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                RaisedButton(
                  onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> TwoPlayerPage())),
                  child: Text(
                    '2 Players!',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  padding: EdgeInsets.all(20.0),
                )
              ],
            ),
          ),
        ),
      );
    }
}