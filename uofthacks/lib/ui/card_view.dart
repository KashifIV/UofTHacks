import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';

class CardView extends StatefulWidget {
  String name;
  File img;

  CardView({Key key, @required this.name, @required this.img}) : super(key: key);

  _CardView createState() => _CardView();
}

class _CardView extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: new Text("${widget.name}"),
    );
  }
}
