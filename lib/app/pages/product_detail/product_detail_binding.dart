import 'package:commdelivery/app/pages/product_detail/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController());
  }

}