import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:uofthacks/ui/card_view.dart';

class VerifyCard extends StatelessWidget{
  @override
  Widget Filter(ViewModel model){
    model.UpdateState(PageState.loading, false);
    return CardView();
  }
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Scaffold(
          body: Filter(model),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: (){ 
              model.AddCard();
              model.clear();
              Navigator.pop(context);
              },
          ),
        ),
      );
    }
}