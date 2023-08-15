import 'package:commdelivery/app/pages/home/home_binding_mobile.dart'
if (dart.library.html) 'package:commdelivery/app/pages/home/home_binding_web.dart';
import 'package:commdelivery/app/pages/home/home_page.dart';

import 'package:commdelivery/app/pages/product_detail/product_detail_binding.dart';
import 'package:commdelivery/app/pages/product_detail/product_detail_page.dart';

import 'package:commdelivery/app/pages/splash/splash_binding.dart';
import 'package:commdelivery/app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.DETAILS,
          page: () {
            return const ProductDetailPage();
            // final args = Get.arguments as Map<String, dynamic>;
            // return ProductDetailPage(
            //   product: args['product'],
            //   order: args['order'],
            // );
          },
          binding: ProductDetailBinding(),
        ),
      ],
    ),
  ];
}
