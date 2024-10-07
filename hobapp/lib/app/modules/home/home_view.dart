// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hobapp/app/modules/home/home_controller.dart';
import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  Widget vBuilder() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Merhaba, bugün kendini nasıl hissediyorsun?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('mood');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff402660)),
              child: const Text(
                'Duygu durumunu seç',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Haftanın Trendleri',
            style: GoogleFonts.poppins(fontSize: 24),
          ),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                  context: Get.context!,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(
                    Get.context!,
                  ).modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(
                              Get.context!,
                            ).size.width,
                            height: MediaQuery.of(
                              Get.context!,
                            ).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.randomMovie.photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Film Adı:  ${controller.randomMovie.title}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Konu:  ${controller.randomMovie.desc}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.close(0);
                                    },
                                    child: const Text(
                                      "Kapat",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  width: Get.size.width,
                  height: 120,
                  color: const Color(0xffDBCBDD),
                  child: const Center(
                    child: ListTile(
                      title: Center(child: Text('HAFTANIN FİLMİ')),
                    ),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                  context: Get.context!,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(
                    Get.context!,
                  ).modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(
                              Get.context!,
                            ).size.width,
                            height: MediaQuery.of(
                              Get.context!,
                            ).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.randomMusic.photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Müzik Adı:  ${controller.randomMusic.title}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Artist:  ${controller.randomMusic.artist}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.close(0);
                                    },
                                    child: const Text(
                                      "Kapat",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  width: Get.size.width,
                  height: 120,
                  color: const Color(0xffDBCBDD),
                  child: const Center(
                    child: ListTile(
                      title: Center(child: Text('HAFTANIN MÜZİĞİ')),
                    ),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                  context: Get.context!,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(
                    Get.context!,
                  ).modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(
                              Get.context!,
                            ).size.width,
                            height: MediaQuery.of(
                              Get.context!,
                            ).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.randomMusic.photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Kitap Adı:  ${controller.randomBook.title}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Konu:  ${controller.randomBook.desc}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.close(0);
                                    },
                                    child: const Text(
                                      "Kapat",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  width: Get.size.width,
                  height: 120,
                  color: const Color(0xffDBCBDD),
                  child: const ListTile(
                    title: Center(child: Text('HAFTANIN KİTABI')),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
