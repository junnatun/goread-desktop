import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: purpleColor,
      borderRadius: BorderRadius.circular(100.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        splashColor: pinkColor,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: Text(
              title,
              style: heading4MediumTextStyle.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
