import 'package:hobapp/app/modules/auth/new_password/new_password_controller.dart';
import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordView extends BaseView<NewPasswordController> {
  const NewPasswordView({super.key});

  @override
  Widget vBuilder() {
    return Center(
      child: Form(
        key: controller.newPasswordFormKey,
        child: Column(
          children: [
            /// # [HOŞ GELDIN YAZISI]
            Text.rich(
              TextSpan(
                  text: 'Lütfen,\n',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Yeni Parolanızı girin ',
                        style: GoogleFonts.poppins(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff402660),
                        )),
                  ]),
            ),

            /// # [PAROLA INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.passwordController,
                validator: (value) {
                  return controller.passwordValidation(value!);
                },
                obscureText: controller.obscurePassword.value,
                decoration: InputDecoration(
                  hintText: 'Yeni Parolanızı girin',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff402660),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showOrhidePassword();
                    },
                    icon: controller.obscureRePassword.value
                        ? const Icon(
                            Icons.visibility,
                            color: Color(0xff402660),
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Color(0xff402660),
                          ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff402660),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            ),

            /// # [PAROLA INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.rePasswordController,
                validator: (value) {
                  return controller.passwordValidation(value!);
                },
                obscureText: controller.obscureRePassword.value,
                decoration: InputDecoration(
                  hintText: 'Yeni Parolanızı Tekrar girin',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff402660),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showOrhideRePassword();
                    },
                    icon: controller.obscureRePassword.value
                        ? const Icon(
                            Icons.visibility,
                            color: Color(0xff402660),
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Color(0xff402660),
                          ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff402660),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.changePassword();
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
