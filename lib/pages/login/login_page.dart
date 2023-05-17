// ignore_for_file: unused_field

import 'package:carent_app/models/active_user.dart';
import 'package:carent_app/services/login_services.dart';
import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/custom_button.dart';
import 'package:carent_app/widgets/custom_snackbar.dart';
import 'package:carent_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //NOTE: Textfields Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String inputUsername = '', inputPassword = '';
  ActiveUser _user = ActiveUser(
    idUser: '',
    username: '',
    role: '',
  );

  @override
  void initState() {
    usernameController.addListener(() {
      setState(() {
        inputUsername = usernameController.value.text;
      });
    });
    passwordController.addListener(() {
      inputPassword = passwordController.value.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: deviceWidth / 2,
            height: deviceHeight,
            // color: purpleColor,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ill_login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth / 2,
            height: deviceHeight,
            // color: pinkColor,
            child: Center(
              child: Container(
                width: 370.h,
                height: 500.h,
                padding: EdgeInsets.all(50.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: orangeLightColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: heading1BlackTextStyle,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Hai, sahabat GoRead! Masuk dan baca buku favoritmu.',
                      style: heading4RegulerTextStyle,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      title: 'Username',
                      hintText: 'Username...',
                      controller: usernameController,
                    ),
                    CustomTextField(
                      title: 'Password',
                      hintText: 'Password...',
                      controller: passwordController,
                      isPass: true,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                      title: 'Sign In',
                      onTap: () async {
                        ActiveUser? result = await LoginServices.login(
                            inputUsername, inputPassword);
                        if (result != null) {
                          setState(() {
                            _user = result;
                          });
                          CustomSnackbar.show(
                            'Yeay!',
                            'Login berhasil!',
                          );
                          Get.toNamed('/dashboardPage');
                        } else {
                          CustomSnackbar.show(
                            'Waduhh!',
                            'Email atau Password tidak sesuai!',
                          );
                        }
                      },
                    ),
                    // SizedBox(
                    //   height: 16.h,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Belum punya akun? ',
                    //       style: heading4RegulerTextStyle,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Sign Up',
                    //         style: heading4BoldTextStyle,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
