import 'package:hobapp/app/modules/auth/register/register_controller.dart';
import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends BaseView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget vBuilder() {
    return Center(
      child: Form(
        key: controller.registerFormKey,
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
                        text: 'KAYIT OL\n',
                        style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff402660))),
                  ]),
            ),

            /// # [AD - SOYAD INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.nameSurnameController,
                decoration: const InputDecoration(
                  hintText: 'Adınızı ve Soyadınızı girin',
                  prefixIcon: Icon(Icons.person, color: Color(0xff402660)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff402660)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                validator: (value) {
                  return controller.nameSurnameValidation(value!);
                },
              ),
            ),

            /// # [DOGUM TARIHI INPUTU]
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: InkWell(
            //     onTap: () {
            //       controller.chooseDate();
            //     },
            //     child: AbsorbPointer(
            //       child: TextFormField(
            //         controller: controller.dateController,
            //         readOnly: true,
            //         decoration: const InputDecoration(
            //           hintText: 'Doğum Tarihinizi seçin',
            //           prefixIcon:
            //               Icon(Icons.date_range, color: Color(0xff402660)),
            //           focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Color(0xff402660)),
            //               borderRadius: BorderRadius.all(Radius.circular(25))),
            //           enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(25))),
            //         ),
            //         validator: (value) {
            //           if (value!.isEmpty) {
            //             return 'Lütfen doğum tarihinizi seçin';
            //           }
            //           return null;
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            /// # [E-POSTA INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: 'E-Postanızı girin',
                  prefixIcon: Icon(Icons.mail, color: Color(0xff402660)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff402660)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                validator: (value) {
                  return controller.emailValidation(value!);
                },
              ),
            ),

            /// # [PAROLA INPUTU]
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Parolanızı girin',
                  prefixIcon: Icon(Icons.lock, color: Color(0xff402660)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff402660)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                validator: (value) {
                  return controller.passwordValidation(value!);
                },
              ),
            ),

            /// # [KAYIT BUTONU]
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.saveUserLocalDb();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff402660),
                    fixedSize:
                        Size(Get.size.width * 0.7, Get.size.height * 0.05)),
                child: const Text('KAYIT OL'),
              ),
            ),

            /// # [KAYIT BUTONU]
            TextButton(
                onPressed: () {
                  controller.goToLogin();
                },
                child: const Text('Giriş Yap')),
          ],
        ),
      ),
    );
  }
}
