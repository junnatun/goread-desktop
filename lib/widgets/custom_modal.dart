import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomModal {
  final String title;
  final double width, height;
  final Widget child;

  const CustomModal({
    required this.title,
    this.width = 400,
    this.height = 600,
    required this.child,
  });

  static show(
    String title,
    double width,
    double height,
    Widget child,
  ) {
    Get.dialog(
      Center(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
            color: orangeLightColor,
            borderRadius: BorderRadius.circular(
              50.r,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: heading2BlackTextStyle,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    child,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
