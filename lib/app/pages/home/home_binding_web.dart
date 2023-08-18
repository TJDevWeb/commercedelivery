import 'package:commdelivery/app/core/rest_client/custom_dio_web.dart';
import 'package:commdelivery/app/core/storage/session_storage.dart';
import 'package:commdelivery/app/pages/home/home_controller_web.dart';
import 'package:commdelivery/app/repositories/products/products_repository_impl.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CustomDio>(() => CustomDio(), fenix: true);
    Get.lazyPut<ProductsRepositoryImpl>(() => ProductsRepositoryImpl(dio: Get.find()), fenix: true);
    Get.lazyPut<SessionStorage>(() => SessionStorage(), fenix: true);
    Get.put(HomeController(Get.find()), permanent: true);
  }

}