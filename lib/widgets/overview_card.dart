import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    Key? key,
    required this.title,
    required this.iconSrc,
    required this.value,
  }) : super(key: key);

  final String title, iconSrc, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.h,
      height: 250.h,
      padding: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
        color: purpleColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.h,
                height: 50.h,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: whiteColor,
                ),
                child: SizedBox(
                  child: Image(
                    image: AssetImage(
                      iconSrc,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                style: heading3MediumTextStyle.copyWith(
                  color: whiteColor,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: heading2BoldTextStyle.copyWith(
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
