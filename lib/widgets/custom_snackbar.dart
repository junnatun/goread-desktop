import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  final String title;
  final String message;

  const CustomSnackbar({
    required this.title,
    required this.message,
  });

  static show(
    String title,
    String message,
  ) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: purpleColor.withOpacity(0.5),
        colorText: whiteColor,
        maxWidth: 300.h,
        margin: EdgeInsets.only(top: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
        icon: SizedBox(
          width: 40.h,
          height: 40.h,
          child:
              const Image(image: AssetImage('assets/icons/icon_warning.png')),
        ));
  }
}
