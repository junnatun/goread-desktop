import 'package:carent_app/pages/books/books_page.dart';
import 'package:carent_app/pages/dashboard/dashboard_page.dart';
import 'package:carent_app/pages/login/login_page.dart';
import 'package:carent_app/pages/members/members_page.dart';
import 'package:carent_app/pages/returns/returns_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8F6FF),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const LoginPage(),
            transition: Transition.fade,
            showCupertinoParallax: false,
            transitionDuration: const Duration(
              milliseconds: 800,
            ),
          ),
          GetPage(
            name: '/dashboardPage',
            page: () => const DashboardPage(),
            transition: Transition.noTransition,
            showCupertinoParallax: false,
            transitionDuration: const Duration(
              milliseconds: 800,
            ),
          ),
          GetPage(
            name: '/returnsPage',
            page: () => const ReturnsPage(),
            transition: Transition.noTransition,
            showCupertinoParallax: false,
            transitionDuration: const Duration(
              milliseconds: 800,
            ),
          ),
          GetPage(
            name: '/membersPage',
            page: () => const MembersPage(),
            transition: Transition.noTransition,
            showCupertinoParallax: false,
            transitionDuration: const Duration(
              milliseconds: 800,
            ),
          ),
          GetPage(
            name: '/booksPage',
            page: () => const BooksPage(),
            transition: Transition.noTransition,
            showCupertinoParallax: false,
            transitionDuration: const Duration(
              milliseconds: 800,
            ),
          ),
        ],
      ),
    );
  }
}
