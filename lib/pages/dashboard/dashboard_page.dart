import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/custom_navbar.dart';
import 'package:carent_app/widgets/overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          padding: EdgeInsets.all(24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomNavbar(),
              SizedBox(
                width: 500.h,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Admin!',
                          style: heading1BlackTextStyle,
                        ),
                        Text(
                          'Every sunrise gives you a new opportunity and hope! Good job, do your best today!',
                          style: heading4RegulerTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OverviewCard(
                              title: 'Total\nPenyewaan',
                              value: '22 Sewa',
                              iconSrc: 'assets/icons/icon_rent_dark.png',
                            ),
                            OverviewCard(
                              title: 'Total\nPendapatan',
                              value: 'Rp2.200.000,-',
                              iconSrc: 'assets/icons/icon_wallet_dark.png',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OverviewCard(
                              title: 'Total\nKatalog',
                              value: '110 Produk',
                              iconSrc: 'assets/icons/icon_catalogue_dark.png',
                            ),
                            OverviewCard(
                              title: 'Total\nMember',
                              value: '15 Member',
                              iconSrc: 'assets/icons/icon_member_dark.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 390.h,
                height: double.infinity,
                padding: EdgeInsets.only(
                  left: 24.h,
                  top: 24.h,
                  right: 24.h,
                ),
                decoration: BoxDecoration(
                  color: purpleLightColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240.h,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 300.h,
                      child: const Image(
                        image: AssetImage('assets/images/ill_dashboard.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
