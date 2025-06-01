import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/enums.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:indar_deco/presentation/ui/screens/AI/recommandation_result_screen.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button.dart';
import 'package:indar_deco/presentation/ui/widgets/dialog/AI_image_dialog.dart';

class RecommandationScreen extends StatelessWidget {
  const RecommandationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
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
                    onTap: ()=> showDialog(context: context, builder: (_)=>const AIImageDialog(aiModel: AIModel.recommandation)),
                child: controller.selectedImageRecommandation!=null ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(controller.selectedImageRecommandation!,height: 200.h,width: double.infinity,fit: BoxFit.cover,)) : Container(width: double.infinity,height: 200.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                child: SvgPicture.string(APPSVG.imagePlaceholderIcon , color: AppColors.primary,fit: BoxFit.scaleDown,),
                ),
              ),
                          const SizedBox(height: 40,),

              PrimaryButton(text: 'Generate Similars', click: ()async{

                Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>  RecommandationResulScreen(images: [],)));
              },
              disabled: controller.selectedImageRecommandation==null,)
            ]),
          ),
        );
      }
    );
  }

}
  