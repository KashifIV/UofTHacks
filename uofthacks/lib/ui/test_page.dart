import 'package:flutter/material.dart';
import 'package:uofthacks/domain/test_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class TestPage extends StatefulWidget{
  _TestPage createState() => _TestPage();
}
class _TestPage extends State<TestPage>{
  File _image;
  Future<void> GetImage(TestModel model) async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      _image = image;    // your model should update the tree without the need of set state,
    });                  // please comment this out to test.
  }
  Widget TestImage(TestModel model){
    if (_image == null) {
      return Center(child: FlutterLogo(size:100));
    }
    else{
      try{
         return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Image.file(
            _image,
            scale: 0.9,
            //width: 2,
          ),
        );
          } catch(e){
            return Container(
              child: Text(e),
        );
      }
    }
  }
  Widget TestText(TestModel model){
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        // Add as many texts as you want
        //Text(model.counter.toString()),
        Text('Testing')
      ],
    ));
  }
  @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<TestModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => Scaffold(
          body: TestImage(model),            //Switch this out for the main visual
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.question_answer),
            onPressed: () => GetImage(model),   //Change what the button do tho
          ),
        ),
      );
    }
}