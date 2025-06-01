import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/di.dart';
import 'package:indar_deco/domain/entities/color.dart';
import 'package:indar_deco/domain/entities/product_style.dart';
import 'package:indar_deco/domain/usecases/artificial_intelligence/change_color_usecase.dart';
import 'package:indar_deco/domain/usecases/artificial_intelligence/change_style_usecase.dart';
import 'package:indar_deco/domain/usecases/artificial_intelligence/generate_decore_usecase.dart';
import 'package:indar_deco/domain/usecases/artificial_intelligence/products_recommandation_usecase.dart';

class AIController extends GetxController {
  File? selectedImageRecommandation;
  File? selectedImagePrompt;
  File? selectedImageColor;
  File? selectedImageStyle;
  MyColor? selectedColor;
  Future<String>? request; 
  int? selectedStyle;
  String prompt ="";
  List<ProductStyle> styleList = [
   const ProductStyle(title: 'classic', image: 'https://i.pinimg.com/736x/72/8a/5e/728a5e3f3505fa004af56151d7c7d358.jpg'),
    const    ProductStyle(title: 'trendy', image: 'https://i.pinimg.com/736x/86/bd/b7/86bdb75f077b0576a0698cf8a1ec2ab6.jpg?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExRDdJZW1xdURkVkFBODdPcwEe9gU5d2L302qROLWZAHLmEeKShcwG2MKuvxnpsEbIaJe27xzLQ9u7reJVoBE_aem_XSEy-GOYd1OP_fTiM1swhw'),
   const ProductStyle(title: 'modern', image: 'https://i.pinimg.com/736x/61/00/99/610099885d1b996962ee9983882820a8.jpg'),
    const ProductStyle(title: 'traditional', image: 'https://i.pinimg.com/736x/9e/1c/ed/9e1ced77ebb6e1dc2eed6d1a845addf5.jpg?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExRDdJZW1xdURkVkFBODdPcwEezAIOrGP4Y3v6iXlhN1PdFEJ4vUvxvgjcGAh7odSd_9x65TdXq9kpy0TwFh4_aem_u-NBbZFOTT21_YHvfjg2FA'),

  ];


final supportedColors=[
  MyColor(title: 'red', color: Colors.red),
  MyColor(title: 'blue', color: Colors.blue),
    MyColor(title: 'green', color: Colors.green),
        MyColor(title: 'yellow', color: Colors.yellow),
        MyColor(title: 'orange', color: Colors.orange),
        MyColor(title: 'purple', color: Colors.purple),      
        MyColor(title: 'brown', color: Colors.brown),
        MyColor(title: 'cyan', color: Colors.cyan),
        MyColor(title: 'pink', color: Colors.pink),
        MyColor(title: 'indigo', color: Colors.indigo),
        MyColor(title: 'teal', color: Colors.teal),
        MyColor(title: 'lime', color: Colors.lime),

];
  final ImagePicker _picker = ImagePicker();
   

  // recommandation //
  Future<void> pickImage(ImageSource source,AIModel model) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
       switch (model) {
      case AIModel.recommandation:
        selectedImageRecommandation = File(image.path);
        break;
      case AIModel.prompt:
        selectedImagePrompt =  File(image.path);
        break;
      case AIModel.changeColor:
        selectedImageColor = File(image.path);
        break;
         case AIModel.changeStyle:
        selectedImageStyle = File(image.path);
        break;
    }
      update();
    }
  }
   
   void setPrompt(String v){
    prompt = v;
    update();
   }

  void clearImage(AIModel model) {
    switch (model) {
      case AIModel.recommandation:
        selectedImageRecommandation = null;
        break;
      case AIModel.prompt:
        selectedImagePrompt = null;
        break;
      case AIModel.changeColor:
        selectedImageColor = null;
        break;
           case AIModel.changeStyle:
        selectedImageStyle = null;
        break;
    }
    update();
  }

  Future<String> generateImage(String payload, AIModel model) async{
    print('payload: $payload, model: $model');
    String result='';
   switch (model) {
      case AIModel.recommandation:
        break;
      case AIModel.prompt:
       final res = await AiGenerateDecoreUsecase(sl())(prompt: payload, file: selectedImagePrompt!);
       res.fold((l) => null, (r) => result=r);
        break;
      case AIModel.changeColor:
         final res = await AiChangeColorUsecase(sl())(color: payload, file: selectedImageColor!);
       res.fold((l) => null, (r) => result=r);
        break;
           case AIModel.changeStyle:
        final res = await AiChangeStyleUsecase(sl())(style: payload, file: selectedImageStyle!);
       res.fold((l) => null, (r) => result=r);
        break;
    }
    return result;
  }

  Future<List<String>> getRecommendedProducts()async{
    List<String> result=[];
 final res = await AiRecommendationUsecase(sl())(file: selectedImageRecommandation!);
       res.fold((l) => print(l.toString()), (r) => result=r);
       return result;
  }

  //style//
  void setStyle(int index){
    selectedStyle = index;
    update();
  }

    //color//
  void setColor(MyColor color){
    selectedColor = color;
    update();
  }
}
