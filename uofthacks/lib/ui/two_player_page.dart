import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uofthacks/domain/view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uofthacks/data/card.dart';
import 'dart:io';
class TwoPlayerPage extends StatefulWidget{
  _TwoPlayerPage createState() => _TwoPlayerPage();
}
class _TwoPlayerPage extends State<TwoPlayerPage>{
  File _image;
  Future<void> GetImage(ViewModel model) async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    model.card = FlashCard(image);
    model.card.generateWords();
  }
  Widget showImage(){
    if (_image == null){
      return Center(child:FlutterLogo(size: 100,));
    }
    else return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Image.file(
        _image,
        scale: 0.9,
        //width: 2,
      ),
    );
  }
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Scaffold(
          body: showImage(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => GetImage(model),
            child: Icon(Icons.add_a_photo),
          ),
           bottomNavigationBar: new BottomAppBar(
            shape: CircularNotchedRectangle(),
                notchMargin: 4.0,
                child: new Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        IconButton(icon: Icon(Icons.refresh), onPressed: () => model.card.generateWords()),
                        IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),
        ),
      );
    }
}