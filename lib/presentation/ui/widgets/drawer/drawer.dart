import 'package:flutter/material.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/presentation/ui/screens/AI/change_color_screen.dart';
import 'package:indar_deco/presentation/ui/screens/AI/change_style_screen.dart';
import 'package:indar_deco/presentation/ui/screens/AI/prompt_generate_screen.dart';
import 'package:indar_deco/presentation/ui/screens/AI/recommandation_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(_)=>const RecommandationScreen()));
          }, child:Text('Recommendation',style: AppTextStyle.blackTitleTextStyle,)),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(_)=>const ChangeColorScreen()));
                    }, child:Text('Change color',style: AppTextStyle.blackTitleTextStyle,)),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(_)=>const ChangeStyleScreen()));
          }, child:Text('Change style',style: AppTextStyle.blackTitleTextStyle,)),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(_)=>const PromptGenerateScreen()));
          }, child:Text('generate decor',style: AppTextStyle.blackTitleTextStyle,)),

        ],
        ),
      ),
    );
  }
}