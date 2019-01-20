import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';

class CardView extends StatelessWidget{
  Widget PageLoader(ViewModel model, BuildContext context){
    switch(model.cardState){
      case PageState.loading:
        return LoadPage(model);
      case PageState.valid:
        return ValidPage(model, context);
      case PageState.failed:
        return Center(child: Text('Sorry the process failed to complete.' ,),);
    }
    //ITS CONSTANTLY REFRESHING

  }
  Widget LoadPage(ViewModel model){
    model.InitializeCard();
    return Center(child: CircularProgressIndicator(),);
  }
  Widget ValidPage(ViewModel model, BuildContext context){
    return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.file(model.card.image),
                  centerTitle: true,
                  title: Text(                  
                    model.card.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ]
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  ListOptions(model),
                ),
              ),
            ],
          );
  }
  List<Widget> ListOptions(ViewModel model) {
    List<Widget> a = [];
    for (int i = 0; i < 4; i++) {
      a.add(new Container(
        height: 100,        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                width: 200,
                child: Text(model.card.bestWords[i],
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.all(20.0),
                child: Text(model.card.translations[i].toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return a;
  }
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Container(
          child: PageLoader(model, context),
          ),
      );
    }
}