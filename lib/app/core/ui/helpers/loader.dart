import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader on GetxController {

  void showLoader(RxBool loaderRx) {
    ever(loaderRx, (loading) async {
      if (loading) {
        Get.dialog(
          Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 60,
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }

}
