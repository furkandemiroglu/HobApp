import 'dart:ui';

import 'package:hobapp/app/modules/splash/splash_controller.dart';
import 'package:hobapp/core/base/base_view.dart';
import 'package:hobapp/core/common/constants/app_string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({super.key});

  @override
  Widget vBuilder() {
    return Stack(
      children: [
        ClipRRect(
          // Clip it cleanly.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(bottom: Get.size.height * 0.2.h),
                  child: Container(
                    padding: const EdgeInsets.all(8), // Border width
                    decoration: const BoxDecoration(
                        color: Color(0xffDBCBDD), shape: BoxShape.circle),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(90), // Image radius
                        child:
                            Image.asset('assets/hobapp.png', fit: BoxFit.fill),
                      ),
                    ),
                  )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Get.size.height * 0.2.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                controller.goToLogin();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff402660),
                  elevation: 5,
                  fixedSize: Size(Get.size.width * 0.6, 50)),
              child: Text(
                AppStringConstants.login,
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Get.size.height * 0.1.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                controller.goToRegister();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF271E33),
                  elevation: 2,
                  fixedSize: Size(Get.size.width * 0.6, 50)),
              child: Text(
                AppStringConstants.register,
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
