
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indar_deco/core/styles/colors.dart';

class PrimaryButtonIcon extends StatelessWidget {
  final String icon ;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool? disabled;
  final void Function()? click;
  const PrimaryButtonIcon({super.key, required this.icon ,required this.click,this.color,this.borderColor,this.textStyle,this.disabled});
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      constraints: BoxConstraints(
        maxHeight: 50.h,
        minHeight: 50.h,
        minWidth: double.infinity,
        maxWidth: double.infinity
      ),
               // width: 150.w,
                child: ElevatedButton(onPressed:disabled??false?null: click,style: ButtonStyle(backgroundColor:MaterialStateProperty.all(disabled??false?AppColors.grey: color ??AppColors.primary),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side:  BorderSide(color :disabled??false?AppColors.grey:borderColor??AppColors.primary)
                  )
                )), child:SvgPicture.string(icon)
                ),
              )
      

    ;
  }
}