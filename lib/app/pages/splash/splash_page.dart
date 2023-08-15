import 'package:commdelivery/app/core/ui/helpers/size_extensions.dart';
import 'package:commdelivery/app/core/ui/widgets/delivery_button.dart';
import 'package:commdelivery/app/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: ColoredBox(
              color: const Color(0XFF140E0E),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: context.screenWidth,
                      //height: context.screenHeight,
                      child: Image.asset(
                        'assets/images/lanche.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.percentHeight(.25),
                        ),
                        Image.asset('assets/images/logo.png'),
                        const SizedBox(
                          height: 80,
                        ),
                        DeliveryButton(
                          label: 'ACESSAR',
                          width: context.percentWidth(.6),
                          height: 35,
                          onPressed: () {
                            controller.acessar();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
