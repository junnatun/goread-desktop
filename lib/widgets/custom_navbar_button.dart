import 'package:carent_app/controllers/navbar_controller.dart';
import 'package:carent_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomNavbarButton extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomNavbarButton({
    Key? key,
    required this.index,
    required this.title,
    required this.routeName,
    required this.iconLight,
    required this.iconDark,
  }) : super(key: key);

  final String title, iconLight, iconDark, routeName;
  final int index;

  @override
  State<CustomNavbarButton> createState() => _CustomNavbarButtonState();
}

class _CustomNavbarButtonState extends State<CustomNavbarButton> {
  @override
  Widget build(BuildContext context) {
    //NOTE: Controller
    NavbarController controller = Get.put(NavbarController());

    return Obx(
      () => Container(
        child: controller.activeIndex.value == widget.index
            ? Container(
                width: double.infinity,
                height: 60.h,
                margin: EdgeInsets.only(bottom: 24.h),
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.h,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color(0xff9988E7),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 24.h,
                            height: 24.h,
                            child: Image(image: AssetImage(widget.iconLight)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Center(
                        child: Text(
                          widget.title,
                          style: heading3BoldTextStyle.copyWith(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(bottom: 24.h),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      splashColor: pinkColor,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.activeIndex.value = widget.index;
                        Get.toNamed(widget.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.h,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24.h,
                                    height: 24.h,
                                    child: Image(
                                        image: AssetImage(widget.iconDark)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              child: Center(
                                child: Text(
                                  widget.title,
                                  style: heading3BoldTextStyle.copyWith(
                                    color: purpleColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
      ),
    );
  }
}
