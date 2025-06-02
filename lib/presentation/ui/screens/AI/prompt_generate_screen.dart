import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:indar_deco/presentation/ui/screens/AI/ai_download_image_result_screen.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button.dart';
import 'package:indar_deco/presentation/ui/widgets/dialog/AI_image_dialog.dart';
import 'package:indar_deco/presentation/ui/widgets/text_fields/promot_input.dart';

class PromptGenerateScreen extends StatelessWidget {
  const PromptGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init:AIController(),
      builder: (controller) {
        return Scaffold(
              appBar: AppBar(title: Text("AI Deco",style: AppTextStyle.appBarTextStyle,),),
              body: Padding(
                padding: const EdgeInsets.all( 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Upload you space image",style: AppTextStyle.blackTitleTextStyle,),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: ()=> showDialog(context: context, builder: (_)=>const AIImageDialog(aiModel: AIModel.prompt)),
                    child: controller.selectedImagePrompt!=null ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(controller.selectedImagePrompt!,height: 200.h,width: double.infinity,fit: BoxFit.cover,)) : Container(width: double.infinity,height: 200.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                    child: SvgPicture.string(APPSVG.imagePlaceholderIcon , color: AppColors.primary,fit: BoxFit.scaleDown,),
                    ),
                  ),         const SizedBox(height: 20,),
                    Text("Describe your desired interior",style: AppTextStyle.blackTitleTextStyle,),
                              const SizedBox(height: 10,),
              PromptInput(hint: "Write your description in english",onChanged: (v) {
                controller.setPrompt(v);
              },),
                              const SizedBox(height: 40,),

                   PrimaryButton(text: 'Generate', click: ()async{
                  //  controller.request =controller.generateImage(prompt.text,AIModel.prompt);
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>const DownloadImageAIResult(image:"assets/images/prompt-output.png" )));
                              
              },
              disabled: controller.prompt.isEmpty || controller.selectedImagePrompt==null )
                ]),
              ),
            );
      }
    );
  }
}
late TextEditingController prompt;



