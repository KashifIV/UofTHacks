import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'dart:async';
import 'dart:io';


/*
Future<void> something() async{
  IamOptions options = await IamOptions(iamApiKey: "5X3edEaKWvi77x486FJiMcS4vhO07gRebuNq7gDMoxCa", url: "https://gateway.watsonplatform.net/visual-recognition/api").build();
  VisualRecognition visualRecognition = new VisualRecognition(iamOptions: options, language: Language.ENGLISH); // Language.ENGLISH is language response 
  ClassifiedImages classifiedImages = await visualRecognition.classifyImageFile("Image File Path");
  print(classifiedImages.getImages()[0].getClassifiers()[0].getClasses()[0].className);

}
*/



void visualRecognitionFile(File image) async {
    IamOptions options = await IamOptions(iamApiKey: "5X3edEaKWvi77x486FJiMcS4vhO07gRebuNq7gDMoxCa", url: "https://gateway.watsonplatform.net/visual-recognition/api").build();
    VisualRecognition visualRecognition = new VisualRecognition(
        iamOptions: options, language: Language.ENGLISH);
    ClassifiedImages classifiedImages =
        await visualRecognition.classifyImageFile(image.path);

    print(classifiedImages
        .getImages()[0]
        .getClassifiers()[0] // need more than 0??
        .getClasses()[0]
        .className);
}