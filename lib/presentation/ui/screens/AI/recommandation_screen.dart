import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/presentation/ui/screens/AI/recommandation_result_screen.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button.dart';

class RecommandationScreen extends StatelessWidget {
  const RecommandationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Deco",style: AppTextStyle.appBarTextStyle,),),
      body: Padding(
        padding: const EdgeInsets.all( 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Upload you space image",style: AppTextStyle.blackTitleTextStyle,),
          const SizedBox(height: 20,),
          Container(width: double.infinity,height: 200.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),),
                      const SizedBox(height: 40,),

          PrimaryButton(text: 'Generate Similars', click: (){
            Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RecommandationResulScreen()));
          })
        ]),
      ),
    );
  }
}