import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/data/auth.dart';
import 'package:uofthacks/ui/group_play.dart';
import 'package:uofthacks/domain/test_model.dart';
import 'package:uofthacks/ui/test_page.dart';
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/ui/list_card.dart';
import 'package:uofthacks/ui/login_page.dart';
import 'package:uofthacks/ui/NavScreens/playwidget.dart';
import 'package:uofthacks/ui/NavScreens/cardWidget.dart';

class HomePage extends StatefulWidget{
  final Auth auth;
  final VoidCallback onSignedOut;
  HomePage({this.auth, this.onSignedOut});
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlayWidget(),
    PlayWidget(),
    cardWidget(),
  ];

  @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
        actions: <Widget> [
           IconButton(
          icon: Icon(Icons.home),
          onPressed:(){ 
            widget.onSignedOut();
            },
            ),
        ],
        title: Text('My App'),
        
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
           BottomNavigationBarItem(
            icon: new Icon(Icons.settings), 
            title: new Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.play_arrow), 
            title: new Text('Play'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.card_giftcard),
            title: new Text('Cards'),
          )
        ],
      ),
      );
    }
    void onTabTapped(int index) {
      setState(()
      {
        _currentIndex = index;
      });
    }
}
