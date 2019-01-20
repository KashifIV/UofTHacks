import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/ui/card_view.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  _CardList createState() => _CardList();
}

class _CardList extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    final title = 'My Cards';

    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this would produce 2 rows.
                crossAxisCount: 2,
                // Generate widgets that display their index in the List
                children: List.generate(model.cards.length, (index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new AssetImage(model.paths[index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ));
  }
}
