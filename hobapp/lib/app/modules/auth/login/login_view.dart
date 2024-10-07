import 'package:hobapp/app/modules/auth/login/login_controller.dart';
import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends BaseView<LoginController> {
  const LoginView({
    super.key,
  });

  @override
  Widget vBuilder() {
    return Center(
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            /// # [HOŞ GELDIN YAZISI]
            Text.rich(
              TextSpan(
                  text: 'HOŞ GELDİN,\n',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'LÜTFEN ',
                        style: GoogleFonts.poppins(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'GİRİŞ YAP\n',
                        style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff402660))),
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
                  prefixIcon: Icon(Icons.mail, color: Color(0xff402660)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff402660)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
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
                  hintText: 'Parolanızı girin',
                  prefixIcon: const Icon(Icons.lock, color: Color(0xff402660)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showOrhidePassword();
                    },
                    icon: controller.obscurePassword.value
                        ? const Icon(Icons.visibility, color: Color(0xff402660))
                        : const Icon(Icons.visibility_off,
                            color: Color(0xff402660)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff402660)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            ),

            /// # [GİRİŞ BUTONU]
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff402660),
                    fixedSize:
                        Size(Get.size.width * 0.7, Get.size.height * 0.05)),
                child: const Text('GİRİŞ YAP'),
              ),
            ),

            /// # [KAYIT BUTONU]
            TextButton(
                onPressed: () {
                  controller.register();
                },
                child: const Text('Kayıt Ol')),
            TextButton(
                onPressed: () {
                  controller.forgotPassword();
                },
                child: const Text('Şifremi Unuttum')),
          ],
        ),
      ),
    );
  }
}
