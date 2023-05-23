import 'package:carent_app/services/overview_services.dart';
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
                          'Books don’t offer real escape, but they can stop a mind scratching itself raw.',
                          style: heading4RegulerTextStyle,
                        ),
                      ],
                    ),
                    FutureBuilder<List<dynamic>?>(
                        future: OverviewServices.getOverview(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OverviewCard(
                                      title: 'Total\nPeminjaman',
                                      value:
                                          '${snapshot.data![0]['totalPeminjaman']} Peminjaman',
                                      iconSrc:
                                          'assets/icons/icon_rent_dark.png',
                                    ),
                                    OverviewCard(
                                      title: 'Buku\nTerfavorit',
                                      value:
                                          '${snapshot.data![1]['judul_buku']}',
                                      iconSrc:
                                          'assets/icons/icon_wallet_dark.png',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OverviewCard(
                                      title: 'Total\nBuku',
                                      value:
                                          '${snapshot.data![2]['totalBuku']} Buku',
                                      iconSrc:
                                          'assets/icons/icon_catalogue_dark.png',
                                    ),
                                    OverviewCard(
                                      title: 'Total\nMember',
                                      value:
                                          '${snapshot.data![3]['totalMember']} Member',
                                      iconSrc:
                                          'assets/icons/icon_member_dark.png',
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: orangeColor,
                            ),
                          );
                        })
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
                  color: orangeLightColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240.h,
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(10.r),
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
