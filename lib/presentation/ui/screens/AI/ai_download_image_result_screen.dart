import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';
import 'package:indar_deco/core/utils/svg.dart';
import 'package:indar_deco/presentation/controllers/ai_controller.dart';
import 'package:indar_deco/presentation/ui/widgets/buttons/primary_button_icon.dart';

class DownloadImageAIResult extends StatelessWidget {
  final String? image;
  
    const DownloadImageAIResult({super.key,this .image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text("Result",style: AppTextStyle.appBarTextStyle,),),
            body:GetBuilder(
              init:  AIController(),
              builder: (controller) {
                return FutureBuilder(
                  future: controller.fakeFuture(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                         return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(image!,fit: BoxFit.cover,width: double.infinity,)),
                          const SizedBox(height: 20,),
                          PrimaryButtonIcon(icon: APPSVG.downloadIcon, click: ()async{
                           await   MediaDownload().downloadMedia(context,image!).then((value) =>  Fluttertoast.showToast(
        msg: "downloading...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primary,
        textColor: Colors.white,
        fontSize: 16.0
    ));

                          })
                        ]),
                      ),
                    );
                    }else if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                     else {
                      return Center(child: Text("Error",));
                    }


                 
                  }
                );
              }
            ),

    );
  }
}