import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/data/auth.dart';
import 'package:uofthacks/ui/group_play.dart';
import 'package:uofthacks/domain/test_model.dart';
import 'package:uofthacks/ui/test_page.dart';
<<<<<<< HEAD
=======
import 'package:uofthacks/ui/make_card.dart';
import 'package:uofthacks/ui/list_card.dart';
>>>>>>> 761d6c4216b4ac4694a739d17efb4ef1208ecaf6
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
  Widget PageLoader(ViewModel model){
    switch(model.initState){
      case PageState.loading:
        return LoadPage(model);
      case PageState.valid:
        return ValidPage(model);
      case PageState.failed:
        return Center(child: Text('Sorry the process failed to complete.' ,),);
    }  
  }
  Widget LoadPage(ViewModel model){
    widget.auth.getCurrentUser().then((test){
      model.CheckAddUser(test);
    });
    return Center(child: CircularProgressIndicator(),);
  }
  Widget ValidPage(ViewModel model){
    return _children[_currentIndex];
  }
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>( 
        builder: (context, child, model) => Scaffold(
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
      body: PageLoader(model),
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
      ));
    }
    void onTabTapped(int index) {
      setState(()
      {
        _currentIndex = index;
      });
    }
}
