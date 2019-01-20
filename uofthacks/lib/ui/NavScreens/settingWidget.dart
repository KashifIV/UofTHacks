import 'package:flutter/material.dart';
import 'package:uofthacks/ui/two_player_page.dart';
import 'package:uofthacks/domain/view_model.dart';

/*
class settingWidget extends StatelessWidget {
  final ViewModel viewModel;

  settingWidget();

  List _languages = ["English", "French", "Spanish", "Mandarin", "Zulu"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentLanguage;

  void initState(){
    _dropDownMenuItems = getDropDownMenuItems();
    super.language = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(){
    List<DropdownMenuItem<String>> items = new List();
    for(String language in _languages){
      items.add(new DropdownMenuItem(
         value: language,
         child: new Text(language)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset('assets/settings.png'),
          new Text("CHoose your current language: "),
          new Container(
            padding: new EdgeInsets.all(16.0),
          ),
          new DropdownButton(
            value: _currentLanguage,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          ),
        ],
      ),
    ),
    );
  }

  void changedDropDownItem(String selectedLanguage){
    ViewModel.upda
    ViewModelupdateLanguage(selectedLanguage);
  }
}*/