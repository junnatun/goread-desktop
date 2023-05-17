import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    Key? key,
    required this.child,
    required this.withButton,
    required this.buttonOnTap,
  }) : super(key: key);

  final Widget child;
  final void Function() buttonOnTap;
  final bool withButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: deviceWidth,
            height: deviceHeight,
            padding: EdgeInsets.all(24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomNavbar(),
                Container(
                  width: 930.h,
                  height: double.infinity,
                  padding: EdgeInsets.all(24.h),
                  decoration: BoxDecoration(
                    color: orangeLightColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: child,
                ),
              ],
            ),
          ),
          withButton
              ? Positioned(
                  bottom: 24.h,
                  right: 24.h,
                  child: SizedBox(
                      width: 150.h,
                      child: Material(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.r),
                          splashColor: pinkColor,
                          highlightColor: Colors.transparent,
                          onTap: buttonOnTap,
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 18.h,
                                  height: 18.h,
                                  child: const Image(
                                      image: AssetImage(
                                          'assets/icons/icon_plus.png')),
                                ),
                                Text(
                                  'Tambah',
                                  style: heading4MediumTextStyle.copyWith(
                                      color: whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
