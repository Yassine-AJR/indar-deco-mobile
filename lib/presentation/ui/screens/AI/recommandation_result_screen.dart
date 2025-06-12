
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';

class RecommandationResulScreen extends StatelessWidget {
  const RecommandationResulScreen({super.key });

  @override
  Widget build(BuildContext context) {
    const imgs = ["https://indaruploads.s3.eu-west-3.amazonaws.com/product_images/1745280826286-tea-table-3d-model-low-poly-obj-fbx-ma-gltf-usdz.jpg",
  "https://indaruploads.s3.eu-west-3.amazonaws.com/product_images/1745281844412-wooden table.jpg",
  "https://indaruploads.s3.eu-west-3.amazonaws.com/color_images/1745281654369-white_table.png",

    ];
    return Scaffold(
      appBar: AppBar(title: Text("Result",style: AppTextStyle.appBarTextStyle,),),
      body: GetBuilder(
        init: AIController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.getRecommendedProducts(),
            builder: (context, snapshot) {
                if(snapshot.hasData){
                  print(snapshot.data);
       return Padding(
                padding: const EdgeInsets.all( 20.0),
                child: GridView.builder(gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 0.85
                      ), 
                      itemCount: imgs.length,
                itemBuilder:  (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(imgs[index],fit: BoxFit.cover,));
                      },)
              );
                }else if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                }else{
                  return Center(child: Text("Error"),);
                }

       
            }
          );
        }
      ),
    );
  }
}