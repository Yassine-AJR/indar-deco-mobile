import 'package:flutter/material.dart';
import 'package:indar_deco/core/styles/colors.dart';

class PromptInput extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;
  const PromptInput({super.key,required this.hint , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
       minLines: 3,
       maxLines: 7,
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide.none ),
      hintText: hint,
        filled: true,
        fillColor: AppColors.white,
        
      ),
    );
  }
}