import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indar_deco/core/utils/enums.dart';

class AIController extends GetxController {
  File? selectedImageRecommandation;
    File? selectedImagePrompt;
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
    }
    print(selectedImagePrompt.toString());
        print(selectedImageRecommandation.toString());

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
    }
    update();
  }

  void sendImage() {
    if (selectedImageRecommandation != null) {
      // Your upload/send logic here
      print("Sending image: ${selectedImageRecommandation!.path}");
    }
  }
}