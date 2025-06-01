
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:indar_deco/presentation/ui/screens/AI/ai_download_image_result_screen.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button.dart';
import 'package:indar_deco/presentation/ui/widgets/dialog/AI_image_dialog.dart';

class ChangeColorScreen extends StatelessWidget {
  const ChangeColorScreen({super.key});

 @override
  Widget build(BuildContext context) {
Color currentColor =const Color(0xff443a49);
    return GetBuilder(
      init:AIController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("AI Deco",style: AppTextStyle.appBarTextStyle,),),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Upload you space image",style: AppTextStyle.blackTitleTextStyle,),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InkWell(
                      onTap: ()=> showDialog(context: context, builder: (_)=>const AIImageDialog(aiModel: AIModel.changeColor)),
                  child: controller.selectedImageColor!=null ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(controller.selectedImageColor!,height: 200.h,width: double.infinity,fit: BoxFit.cover,)) : Container(width: double.infinity,height: 200.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                  child: SvgPicture.string(APPSVG.imagePlaceholderIcon , color: AppColors.primary,fit: BoxFit.scaleDown,),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
                    Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Change Color",style: AppTextStyle.blackTitleTextStyle,),
                    ),
                      const SizedBox(height: 10,),
            Center(
              child: BlockPicker(
                      layoutBuilder: (context, colors, child) {
              // This disables scrolling by building all items in a wrap
              return Wrap(
                children: colors.map((color) => child(color)).toList(),
              );
              },
            itemBuilder: (color, isCurrentColor, changeColor) {
                return GestureDetector(
                  onTap: () => changeColor(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 48,  // Increase size here
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        border: isCurrentColor
                            ? Border.all(
                                color: AppColors.primary,
                                width: 3,
                              )
                            : null,
                      ),
                    ),
                  ),
                );
              },
              availableColors: controller.supportedColors.map((e) => e.color).toList(),
                    pickerColor: currentColor,
                    onColorChanged: (c){
                      controller.setColor(controller.supportedColors.firstWhere((element) => element.color==c));
                    },
                  ),
            ),

                          const SizedBox(height: 40,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PrimaryButton(text: 'Generate', click: ()async{
                  controller.request =   controller.generateImage(controller.selectedColor!.title,AIModel.changeColor);
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DownloadImageAIResult()));
                                },
                disabled: controller.selectedImageColor==null||controller.selectedColor==null),
              )
            ]),
          ),
        );
      }
    );
    
    }
}