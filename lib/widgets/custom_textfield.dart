import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.isPass = false,
  }) : super(key: key);

  final String title, hintText;
  final bool isPass;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: heading3MediumTextStyle,
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: double.infinity,
            height: 40.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TextField(
              cursorColor: purpleDarkColor,
              style: heading4RegulerTextStyle,
              controller: widget.controller,
              obscureText: widget.isPass ? true : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: heading4RegulerTextStyle.copyWith(
                  color: purpleDarkColor.withOpacity(0.8),
                ),
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
