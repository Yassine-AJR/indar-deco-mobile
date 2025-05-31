import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indar_deco/core/utils/enums.dart';

class AIController extends GetxController {
  File? selectedImageRecommandation;
    File? selectedImagePrompt;
  File? selectedImageColor;
    File? selectedImageStyle;
    Color? selectedColor;

  int? selectedStyle;
    String prompt ="";

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

  void sendImage() {
    if (selectedImageRecommandation != null) {
      // Your upload/send logic here
      print("Sending image: ${selectedImageRecommandation!.path}");
    }
  }

  //style//
  void setStyle(int index){
    selectedStyle = index;
    update();
  }

    //color//
  void setColor(Color color){
    selectedColor = color;
    update();
  }
}