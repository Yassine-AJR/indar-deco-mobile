import 'package:flutter/material.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button_icon.dart';

class DownloadImageAIResult extends StatelessWidget {
  const DownloadImageAIResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text("Result",style: AppTextStyle.appBarTextStyle,),),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network("https://img.designswan.com/2023/02/ai-furniture/1.jpg",fit: BoxFit.cover,width: double.infinity,)),
                  const SizedBox(height: 20,),
                  PrimaryButtonIcon(icon: APPSVG.downloadIcon, click: (){})
                ]),
              ),
            ),

    );
  }
}