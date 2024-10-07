import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgotpass_controller.dart';

class ForgotPasswordView extends BaseView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget vBuilder() {
    return Center(
      child: Form(
        key: controller.forgotPasswordFormKey,
        child: Column(
          children: [
            /// # [HOŞ GELDIN YAZISI]
            Text.rich(
              TextSpan(
                  text: 'Parolanızı sıfırlamak için,\n',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Lütfen ',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'E-Posta adresinizi girin\n',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff402660),
                        )),
                  ]),
            ),

            /// # [EPOSTA INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.emailController,
                validator: (value) {
                  return controller.emailValidation(value!);
                },
                decoration: const InputDecoration(
                  hintText: 'E-Postanızı girin',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color(0xff402660),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff402660),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.checkEmail();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff402660),
                    fixedSize:
                        Size(Get.size.width * 0.7, Get.size.height * 0.05)),
                child: const Text('PAROLAYI SIFIRLA'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
