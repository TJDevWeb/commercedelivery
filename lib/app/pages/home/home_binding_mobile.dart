import 'package:commdelivery/app/core/rest_client/custom_dio_native.dart';
import 'package:commdelivery/app/pages/home/home_controller_mobile.dart';
import 'package:commdelivery/app/repositories/products/products_repository_impl.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CustomDio>(() => CustomDio());
    Get.lazyPut<ProductsRepositoryImpl>(() => ProductsRepositoryImpl(dio: Get.find()));
    Get.put(HomeController(Get.find()));
  }

}