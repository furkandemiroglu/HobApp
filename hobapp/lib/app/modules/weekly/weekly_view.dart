import 'package:hobapp/core/base/base_view.dart';
import 'package:flutter/material.dart';

import 'weekly_controller.dart';

class WeeklyView extends BaseView<WeeklyController> {
  const WeeklyView({super.key});

  @override
  Widget vBuilder() {
    return SingleChildScrollView(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container();
        },
        itemCount: 10,
      ),
    );
  }
}
