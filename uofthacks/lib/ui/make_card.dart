import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'package:uofthacks/ui/generate_words.dart';

class MakeCard extends StatefulWidget {
  _MakeCard createState() => _MakeCard();
}

class _MakeCard extends State<MakeCard> {
  void initState() {
    super.initState();
    //getCardName();
  }

  Future<void> getCameraImage(ViewModel model) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    model.UpdateImage(image);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenerateWords(img: model.card.image)),
    );
  }

  Future<void> getGalleryImage(ViewModel model) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    model.UpdateImage(image);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenerateWords(img: model.card.image)),
    );
  }

  Widget showImage(ViewModel model) {
    if (model.card == null) {
      return Center(
          child: FlutterLogo(
        size: 100,
      ));
    } else
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Image.file(
          model.card.image,
          scale: 0.9,
          //width: 2,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      rebuildOnChange: true,
      builder: (context, child, model) => Scaffold(
          body: Center(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'camera',
                onPressed: () => getCameraImage(model),
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(width: 40,),
              FloatingActionButton(
                heroTag: 'gallery',
                onPressed: () => getGalleryImage(model),
                child: Icon(Icons.add_photo_alternate),
              ),
            ],
          ))),
    );
  }
}
