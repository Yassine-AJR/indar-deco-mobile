import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AIImageDialog extends StatelessWidget {
  final AIModel aiModel;
  const AIImageDialog({super.key , required this.aiModel});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: AIController(),
      builder: (controller) {
        return AlertDialog(
            title: Text(  AppLocalizations.of(context)!.upload_image,
                      style: AppTextStyle.blackTitleTextStyle,),
            content:Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 IconButton(
                                  onPressed: () async {
                                                  controller.pickImage(ImageSource.camera,aiModel).then((value) => Navigator.of(context).pop());
            
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    size: 40,
                                    color: AppColors.primary,
                                  )),
              
            
                  IconButton(
                                  onPressed: () async {
                                             await controller.pickImage(ImageSource.gallery,aiModel).then((value) => Navigator.of(context).pop());
            
                                  },
                                  icon: const Icon(
                                    Icons.image,
                                    size: 40,
                                    color: AppColors.primary,
                                  )),
              ],),
            ) ,
            
          );
      }
    );
  }
}