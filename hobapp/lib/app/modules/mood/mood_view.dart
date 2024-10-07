import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hobapp/app/modules/mood/mood_controller.dart';
import 'package:hobapp/core/base/base_view.dart';

class MoodView extends BaseView<MoodController> {
  const MoodView({super.key});

  @override
  Widget vBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'NASIL HİSSEDİYORSUN?',
            style: GoogleFonts.poppins(fontSize: 24),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: controller.moodList.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        'recommended',
                        arguments: controller.moodList[index].id!,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xffDBCBDD),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        controller.moodList[index].title!,
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
