import 'package:carent_app/controllers/navbar_controller.dart';
import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/custom_button.dart';
import 'package:carent_app/widgets/custom_modal.dart';
import 'package:carent_app/widgets/custom_navbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.h,
      height: double.infinity,
      padding: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
        color: orangeLightColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 120.h,
                child: const Image(
                  image: AssetImage('assets/icons/icon_carent.png'),
                ),
              ),
            ],
          ),
          Column(
            children: [
              CustomNavbarButton(
                index: 0,
                title: 'Dashboard',
                routeName: '/dashboardPage',
                iconLight: 'assets/icons/icon_home_white.png',
                iconDark: 'assets/icons/icon_home_dark.png',
              ),
              CustomNavbarButton(
                index: 1,
                title: 'Borrows',
                routeName: '/rentsPage',
                iconLight: 'assets/icons/icon_rent_white.png',
                iconDark: 'assets/icons/icon_rent_dark.png',
              ),
              CustomNavbarButton(
                index: 2,
                title: 'Returns',
                routeName: '/returnsPage',
                iconLight: 'assets/icons/icon_return_white.png',
                iconDark: 'assets/icons/icon_return_dark.png',
              ),
              CustomNavbarButton(
                index: 3,
                title: 'Books',
                routeName: '/cataloguePage',
                iconLight: 'assets/icons/icon_catalogue_white.png',
                iconDark: 'assets/icons/icon_catalogue_dark.png',
              ),
              CustomNavbarButton(
                index: 4,
                title: 'Members',
                routeName: '/membersPage',
                iconLight: 'assets/icons/icon_member_white.png',
                iconDark: 'assets/icons/icon_member_dark.png',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60.h,
                height: 60.h,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: orangeColor,
                ),
                child: Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    // color: purpleColor,
                  ),
                  child: const Image(
                    image: AssetImage('assets/icons/icon_avatar_male.png'),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5.r),
                  splashColor: pinkColor,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    CustomModal.show(
                      'Warning!',
                      400.h,
                      250.h,
                      Column(
                        children: [
                          const Text("Yakin mau Logout?"),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomButton(
                            title: 'Logout',
                            onTap: () {
                              //NOTE: Controller
                              NavbarController controller =
                                  Get.put(NavbarController());

                              controller.activeIndex.value = 0;
                              Get.toNamed('/');
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 30.h,
                    height: 30.h,
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/icons/icon_logout.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
