
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';

class RecommandationResulScreen extends StatelessWidget {
  final List<String> images;
  const RecommandationResulScreen({super.key , required this.images});

  @override
  Widget build(BuildContext context) {
  //   const imgs = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa49YU-TBKvmIvhiOwLWD2bCnsWQKYB7_2Ig&s",
  // "https://meubletunisie.tn/wp-content/uploads/2022/11/PHOTO-2022-09-02-11-27-48-1.jpg",
  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3QK15Wg8-xIPdStQum6JrpGHixarbtazIoQ&s",
  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC3S_glmECQe9wit_bhSAzf23NJ-QsGQznWw&s",
  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5aL-v-oO3a7Zo5pDTeOSGuwZxUT2wUoDz1w&s"
  //   ];
    return Scaffold(
      appBar: AppBar(title: Text("Result",style: AppTextStyle.appBarTextStyle,),),
      body: GetBuilder(
        init: AIController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.getRecommendedProducts(),
            builder: (context, snapshot) {
                if(snapshot.hasData){
       return Padding(
                padding: const EdgeInsets.all( 20.0),
                child: GridView.builder(gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 0.85
                      ), 
                      itemCount: images.length,
                itemBuilder:  (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(images[index],fit: BoxFit.cover,));
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