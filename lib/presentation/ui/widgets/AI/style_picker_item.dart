import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indar_deco/core/styles/colors.dart';
import 'package:indar_deco/core/styles/text_styles.dart';

class AIStylePickerItem extends StatelessWidget {
  final bool selected;
  final String img;
  final String title;
  const AIStylePickerItem({super.key , required this.selected,required this.img,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.lightShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 80.w,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(img , fit: BoxFit.cover,width: 60.w,height: 60,)),
          Text(title,style: AppTextStyle.smallBlackTitleTextStyle.copyWith(color: selected? AppColors.white:AppColors.black))
      ]),

    );
  }
}