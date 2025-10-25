import 'package:flutter/material.dart';
import 'package:wave_money_code_test/const/color/color.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 46,
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          hintText: 'Search by Ingredients name',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: AppColors.titleTextColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: AppColors.titleTextColor, width: 1),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}