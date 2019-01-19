import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
class MakeCard extends StatefulWidget{
  _MakeCard createState() => _MakeCard();
}
class _MakeCard extends State<MakeCard>{
  File _image;

  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
          body: Text('something'),
        ),
      );
    }
}