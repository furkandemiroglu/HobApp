import 'package:flutter/material.dart';
import 'package:hobapp/app/data/services/happy_data.dart';
import 'package:hobapp/app/data/services/curios_data.dart';
import 'package:hobapp/app/data/services/excited_data.dart';
import 'package:hobapp/app/data/services/love_data.dart';
import 'package:hobapp/app/data/services/sad_data.dart';
import 'package:hobapp/app/data/services/tired_data.dart';
import 'package:hobapp/app/modules/recommended/recommended_controller.dart';
import 'package:hobapp/core/base/base_view.dart';

class RecommendedView extends BaseView<RecommendeController> {
  const RecommendedView({super.key});

  @override
  Widget vBuilder() {
    return ListView(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SENİN İÇİN FİLM ÖNERİSİ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            buildMovieArea(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SENİN İÇİN MÜZİK ÖNERİSİ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            buildMusicArea(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SENİN İÇİN KİTAP ÖNERİSİ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            buildBookArea(),
          ],
        ),
      ],
    );
  }

  SizedBox buildBookArea() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.moodId == 1
            ? happyBookList.length
            : controller.moodId == 2
                ? curiosBookList.length
                : controller.moodId == 3
                    ? sadBookList.length
                    : controller.moodId == 4
                        ? excitedBookList.length
                        : controller.moodId == 5
                            ? tiredMovieList.length
                            : loveMovieList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.moodId == 1
                                        ? happyBookList[index].photo!
                                        : controller.moodId == 2
                                            ? curiosBookList[index].photo!
                                            : controller.moodId == 3
                                                ? sadBookList[index].photo!
                                                : controller.moodId == 4
                                                    ? excitedBookList[index]
                                                        .photo!
                                                    : controller.moodId == 5
                                                        ? tiredBookList[index]
                                                            .photo!
                                                        : loveBookList[index]
                                                            .photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Film Adı:  ${controller.moodId == 1 ? happyBookList[index].title! : controller.moodId == 2 ? curiosBookList[index].title! : controller.moodId == 3 ? sadBookList[index].title! : controller.moodId == 4 ? excitedBookList[index].title! : controller.moodId == 5 ? tiredBookList[index].title! : loveBookList[index].title!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Konu:  ${controller.moodId == 1 ? happyBookList[index].desc! : controller.moodId == 2 ? curiosBookList[index].desc! : controller.moodId == 3 ? sadBookList[index].desc! : controller.moodId == 4 ? excitedBookList[index].desc! : controller.moodId == 5 ? tiredBookList[index].desc! : loveBookList[index].desc!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '  Yorumlar:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.moodId == 1
                                          ? happyMovieList[index]
                                              .reviews!
                                              .length
                                          : controller.moodId == 2
                                              ? curiosMovieList[index]
                                                  .reviews!
                                                  .length
                                              : controller.moodId == 3
                                                  ? sadMovieList[index]
                                                      .reviews!
                                                      .length
                                                  : controller.moodId == 4
                                                      ? excitedMovieList[index]
                                                          .reviews!
                                                          .length
                                                      : controller.moodId == 5
                                                          ? tiredMovieList[
                                                                  index]
                                                              .reviews!
                                                              .length
                                                          : loveMovieList[index]
                                                              .reviews!
                                                              .length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, reviewIndex) {
                                        final List<String>? reviews = controller
                                                    .moodId ==
                                                1
                                            ? happyMovieList[index].reviews
                                            : controller.moodId == 2
                                                ? curiosMovieList[index].reviews
                                                : controller.moodId == 3
                                                    ? sadMovieList[index]
                                                        .reviews
                                                    : controller.moodId == 4
                                                        ? excitedMovieList[
                                                                index]
                                                            .reviews
                                                        : controller.moodId == 5
                                                            ? tiredMovieList[
                                                                    index]
                                                                .reviews
                                                            : loveMovieList[
                                                                    index]
                                                                .reviews;

                                        final String review =
                                            reviews?[reviewIndex] ?? '';
                                        String rastgeleIsim =
                                            controller.rastgeleIsimOlustur();
                                        return ListTile(
                                          title: Text(rastgeleIsim),
                                          subtitle: Text(review),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  minLines: 2,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.send)),
                                    hintText: 'Yorum Yaz',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Kapat",
                                    style: TextStyle(color: Colors.white),
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    Image.asset(
                      controller.moodId == 1
                          ? happyBookList[index].photo!
                          : controller.moodId == 2
                              ? curiosBookList[index].photo!
                              : controller.moodId == 3
                                  ? sadBookList[index].photo!
                                  : controller.moodId == 4
                                      ? excitedBookList[index].photo!
                                      : controller.moodId == 5
                                          ? tiredBookList[index].photo!
                                          : loveBookList[index].photo!,
                      scale: 1.5,
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      controller.moodId == 1
                          ? happyBookList[index].title!
                          : controller.moodId == 2
                              ? curiosBookList[index].title!
                              : controller.moodId == 3
                                  ? sadBookList[index].title!
                                  : controller.moodId == 4
                                      ? excitedBookList[index].title!
                                      : controller.moodId == 5
                                          ? tiredBookList[index].title!
                                          : loveBookList[index].title!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///[MÜZİK ALANI]
  SizedBox buildMusicArea() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.moodId == 1
            ? happyMusicList.length
            : controller.moodId == 2
                ? curiosMusicList.length
                : controller.moodId == 3
                    ? sadMusicList.length
                    : controller.moodId == 4
                        ? excitedMusicList.length
                        : controller.moodId == 5
                            ? tiredMusicList.length
                            : loveMusicList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.moodId == 1
                                        ? happyMusicList[index].photo!
                                        : controller.moodId == 2
                                            ? curiosMusicList[index].photo!
                                            : controller.moodId == 3
                                                ? sadMusicList[index].photo!
                                                : controller.moodId == 4
                                                    ? excitedMusicList[index]
                                                        .photo!
                                                    : controller.moodId == 5
                                                        ? tiredMusicList[index]
                                                            .photo!
                                                        : loveMusicList[index]
                                                            .photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Müzik Adı:  ${controller.moodId == 1 ? happyMusicList[index].title! : controller.moodId == 2 ? curiosMusicList[index].title! : controller.moodId == 3 ? sadMusicList[index].title! : controller.moodId == 4 ? excitedMusicList[index].title! : controller.moodId == 5 ? tiredMusicList[index].title! : loveMusicList[index].title!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Artist:  ${controller.moodId == 1 ? happyMusicList[index].artist! : controller.moodId == 2 ? curiosMusicList[index].artist! : controller.moodId == 3 ? sadMusicList[index].artist! : controller.moodId == 4 ? excitedMusicList[index].artist! : controller.moodId == 5 ? tiredMusicList[index].artist! : loveMusicList[index].artist!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '  Yorumlar:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.moodId == 1
                                          ? happyMovieList[index]
                                              .reviews!
                                              .length
                                          : controller.moodId == 2
                                              ? curiosMovieList[index]
                                                  .reviews!
                                                  .length
                                              : controller.moodId == 3
                                                  ? sadMovieList[index]
                                                      .reviews!
                                                      .length
                                                  : controller.moodId == 4
                                                      ? excitedMovieList[index]
                                                          .reviews!
                                                          .length
                                                      : controller.moodId == 5
                                                          ? tiredMovieList[
                                                                  index]
                                                              .reviews!
                                                              .length
                                                          : loveMovieList[index]
                                                              .reviews!
                                                              .length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, reviewIndex) {
                                        final List<String>? reviews = controller
                                                    .moodId ==
                                                1
                                            ? happyMovieList[index].reviews
                                            : controller.moodId == 2
                                                ? curiosMovieList[index].reviews
                                                : controller.moodId == 3
                                                    ? sadMovieList[index]
                                                        .reviews
                                                    : controller.moodId == 4
                                                        ? excitedMovieList[
                                                                index]
                                                            .reviews
                                                        : controller.moodId == 5
                                                            ? tiredMovieList[
                                                                    index]
                                                                .reviews
                                                            : loveMovieList[
                                                                    index]
                                                                .reviews;

                                        final String review =
                                            reviews?[reviewIndex] ?? '';
                                        String rastgeleIsim =
                                            controller.rastgeleIsimOlustur();
                                        return ListTile(
                                          title: Text(rastgeleIsim),
                                          subtitle: Text(review),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  minLines: 2,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.send)),
                                    hintText: 'Yorum Yaz',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Kapat",
                                    style: TextStyle(color: Colors.white),
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    Image.asset(
                      controller.moodId == 1
                          ? happyMusicList[index].photo!
                          : controller.moodId == 2
                              ? curiosMusicList[index].photo!
                              : controller.moodId == 3
                                  ? sadMusicList[index].photo!
                                  : controller.moodId == 4
                                      ? excitedMusicList[index].photo!
                                      : controller.moodId == 5
                                          ? tiredMusicList[index].photo!
                                          : loveMusicList[index].photo!,
                      scale: 1.5,
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      controller.moodId == 1
                          ? happyMusicList[index].title!
                          : controller.moodId == 2
                              ? curiosMusicList[index].title!
                              : controller.moodId == 3
                                  ? sadMusicList[index].title!
                                  : controller.moodId == 4
                                      ? excitedMusicList[index].title!
                                      : controller.moodId == 5
                                          ? tiredMusicList[index].title!
                                          : loveMusicList[index].title!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///[FİLM ALANI]

  SizedBox buildMovieArea() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.moodId == 1
            ? happyMovieList.length
            : controller.moodId == 2
                ? curiosMovieList.length
                : controller.moodId == 3
                    ? sadMovieList.length
                    : controller.moodId == 4
                        ? excitedMovieList.length
                        : controller.moodId == 5
                            ? tiredMovieList.length
                            : loveMovieList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    controller.moodId == 1
                                        ? happyMovieList[index].photo!
                                        : controller.moodId == 2
                                            ? curiosMovieList[index].photo!
                                            : controller.moodId == 3
                                                ? sadMovieList[index].photo!
                                                : controller.moodId == 4
                                                    ? excitedMovieList[index]
                                                        .photo!
                                                    : controller.moodId == 5
                                                        ? tiredMovieList[index]
                                                            .photo!
                                                        : loveMovieList[index]
                                                            .photo!,
                                    scale: 2,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Film Adı:  ${controller.moodId == 1 ? happyMovieList[index].title! : controller.moodId == 2 ? curiosMovieList[index].title! : controller.moodId == 3 ? sadMovieList[index].title! : controller.moodId == 4 ? excitedMovieList[index].title! : controller.moodId == 5 ? tiredMovieList[index].title! : loveMovieList[index].title!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Konu:  ${controller.moodId == 1 ? happyMovieList[index].desc! : controller.moodId == 2 ? curiosMovieList[index].desc! : controller.moodId == 3 ? sadMovieList[index].desc! : controller.moodId == 4 ? excitedMovieList[index].desc! : controller.moodId == 5 ? tiredMovieList[index].desc! : loveMovieList[index].desc!}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '  Yorumlar:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.moodId == 1
                                          ? happyMovieList[index]
                                              .reviews!
                                              .length
                                          : controller.moodId == 2
                                              ? curiosMovieList[index]
                                                  .reviews!
                                                  .length
                                              : controller.moodId == 3
                                                  ? sadMovieList[index]
                                                      .reviews!
                                                      .length
                                                  : controller.moodId == 4
                                                      ? excitedMovieList[index]
                                                          .reviews!
                                                          .length
                                                      : controller.moodId == 5
                                                          ? tiredMovieList[
                                                                  index]
                                                              .reviews!
                                                              .length
                                                          : loveMovieList[index]
                                                              .reviews!
                                                              .length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, reviewIndex) {
                                        final List<String>? reviews = controller
                                                    .moodId ==
                                                1
                                            ? happyMovieList[index].reviews
                                            : controller.moodId == 2
                                                ? curiosMovieList[index].reviews
                                                : controller.moodId == 3
                                                    ? sadMovieList[index]
                                                        .reviews
                                                    : controller.moodId == 4
                                                        ? excitedMovieList[
                                                                index]
                                                            .reviews
                                                        : controller.moodId == 5
                                                            ? tiredMovieList[
                                                                    index]
                                                                .reviews
                                                            : loveMovieList[
                                                                    index]
                                                                .reviews;

                                        final String review =
                                            reviews?[reviewIndex] ?? '';
                                        String rastgeleIsim =
                                            controller.rastgeleIsimOlustur();
                                        return ListTile(
                                          title: Text(rastgeleIsim),
                                          subtitle: Text(review),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  minLines: 2,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.send)),
                                    hintText: 'Yorum Yaz',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Kapat",
                                    style: TextStyle(color: Colors.white),
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    Image.asset(
                      controller.moodId == 1
                          ? happyMovieList[index].photo!
                          : controller.moodId == 2
                              ? curiosMovieList[index].photo!
                              : controller.moodId == 3
                                  ? sadMovieList[index].photo!
                                  : controller.moodId == 4
                                      ? excitedMovieList[index].photo!
                                      : controller.moodId == 5
                                          ? tiredMovieList[index].photo!
                                          : loveMovieList[index].photo!,
                      scale: 1.5,
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      controller.moodId == 1
                          ? happyMovieList[index].title!
                          : controller.moodId == 2
                              ? curiosMovieList[index].title!
                              : controller.moodId == 3
                                  ? sadMovieList[index].title!
                                  : controller.moodId == 4
                                      ? excitedMovieList[index].title!
                                      : controller.moodId == 5
                                          ? tiredMovieList[index].title!
                                          : loveMovieList[index].title!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
