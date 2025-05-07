import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AIController extends GetxController {
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
  }

  void clearImage() {
    selectedImage = null;
    update();
  }

  void sendImage() {
    if (selectedImage != null) {
      // Your upload/send logic here
      print("Sending image: ${selectedImage!.path}");
    }
  }
}