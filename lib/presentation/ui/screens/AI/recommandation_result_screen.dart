import 'package:flutter/material.dart';
import 'package:indar_deco/core/styles/text_styles.dart';

class RecommandationResulScreen extends StatelessWidget {
  const RecommandationResulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result",style: AppTextStyle.appBarTextStyle,),),
      body: Padding(
        padding: const EdgeInsets.all( 20.0),
        child: GridView.builder(gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.85
              ), 
              itemCount: 5,
        itemBuilder:  (context, index) {
                return Container(
                  
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                  child: Text("index: $index"),
                );
              },)
      ),
    );
  }
}