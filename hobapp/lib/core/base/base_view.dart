import 'package:hobapp/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  Size get preferredSize =>
      Get.width >= 390 ? Size.fromHeight(0.1.sw) : Size.fromHeight(0.15.sw);
  const BaseView({Key? key, this.appBarHide = true}) : super(key: key);

  final bool appBarHide;
  final String? tag = null;
  final String? pageTitle = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: controller.hideAppbar.value
                ? null
                : AppBar(
                    automaticallyImplyLeading: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: const IconThemeData(color: Colors.black),
                  ),
            //extendBodyBehindAppBar: true,
            body: vBuilder(),
          ),
        );
      },
    );
  }

  Widget vBuilder();
}
