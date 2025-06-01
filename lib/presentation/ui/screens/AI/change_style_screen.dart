import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:indar_deco/presentation/ui/screens/AI/ai_download_image_result_screen.dart';
import 'package:indar_deco/presentation/ui/widgets/AI/style_picker_item.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button.dart';
import 'package:indar_deco/presentation/ui/widgets/dialog/AI_image_dialog.dart';

class ChangeStyleScreen extends StatelessWidget {
  const ChangeStyleScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:AIController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("AI Deco",style: AppTextStyle.appBarTextStyle,),),
          body: Column(
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
                    onTap: ()=> showDialog(context: context, builder: (_)=>const AIImageDialog(aiModel: AIModel.changeStyle)),
                child: controller.selectedImageStyle!=null ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(controller.selectedImageStyle!,height: 200.h,width: double.infinity,fit: BoxFit.cover,)) : Container(width: double.infinity,height: 200.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                child: SvgPicture.string(APPSVG.imagePlaceholderIcon , color: AppColors.primary,fit: BoxFit.scaleDown,),
                ),
              ),
            ),
            const SizedBox(height: 20,),
                  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Change Style",style: AppTextStyle.blackTitleTextStyle,),
                  ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: controller.styleList.length,
                        itemBuilder: (_,index)=>Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: (){
                              controller.setStyle(index);
                            },
                            child: AIStylePickerItem(selected: index==controller.selectedStyle, img: controller.styleList[index].image, title: controller.styleList[index].title)),
                        )),
                    ),
                        const SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryButton(text: 'Generate', click: ()async{
                controller.request = controller.generateImage('classic',AIModel.changeStyle);
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DownloadImageAIResult()));
                              },
              disabled: controller.selectedImageStyle==null || controller.selectedStyle==null,),
            )
          ]),
        );
      }
    );
    
    }
}