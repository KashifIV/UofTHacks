import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'dart:async';
import 'dart:io';

Future<List<ClassResult>> visualRecognitionFile(File image) async {
    IamOptions options = await IamOptions(iamApiKey: "5X3edEaKWvi77x486FJiMcS4vhO07gRebuNq7gDMoxCa", url: "https://gateway.watsonplatform.net/visual-recognition/api").build();
    VisualRecognition visualRecognition = new VisualRecognition(
        iamOptions: options, language: Language.ENGLISH);
    ClassifiedImages classifiedImages =
        await visualRecognition.classifyImageFile(image.path);

    print('----------------------------------------------------------');
    //classifiedImages.getImages()[0].getClassifiers()[0].getClasses().forEach((item) {
      //await languageTranslator(item.className);

      //print(item.className + ' :' + item.score.toString());
    //});
    //classifiedImages.getImages()[0].getClassifiers()[0].getClasses().forEach((w) =>  languageTranslator(w.className));

    //languageTranslator(classifiedImages.getImages()[0].getClassifiers()[0].getClasses()[0].className);
    
    return classifiedImages.getImages()[0].getClassifiers()[0].getClasses();

}

Future<String> languageTranslator(String text) async {
    IamOptions options = await IamOptions(iamApiKey: "ww6dD2eioGcGKCT2Z-3cM5eyheW7o4lPmSgHej6i3Z-X", url: "https://gateway.watsonplatform.net/language-translator/api").build();
    LanguageTranslator service = new LanguageTranslator(iamOptions: options);
    TranslationResult translationResult = await service.translate(text, Language.ENGLISH, Language.FRENCH);
    print(translationResult);
    
    return translationResult.translations.toString();
}