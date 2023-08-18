import 'package:get/get.dart';

import 'package:commdelivery/app/core/ui/helpers/loader.dart';
import 'package:commdelivery/app/core/ui/helpers/messages.dart';
import 'package:commdelivery/app/dto/order_product_dto.dart';
import 'package:commdelivery/app/models/product_model.dart';
import 'package:commdelivery/app/pages/home/home_controller_web.dart';

class ProductDetailController extends GetxController with Loader, Messages {

  final _loading = false.obs;
  final _message = Rxn<MessagesModel>();

  late final Rx<ProductModel> _product;
  ProductModel get product => _product.value;

  final Rxn<OrderProductDto?> _order = Rxn<OrderProductDto?>();
  OrderProductDto? get order => _order.value;

  final _amount = 1.obs;
  int get amount => _amount.value;

  late final bool _hasOrder;

  ProductDetailController();

  @override
  Future<void> onInit() async {
    super.onInit();
    showLoader(_loading);
    messageListener(_message);

    final homecontroller = Get.find<HomeController>();
    if (homecontroller.products.isEmpty) {
      await homecontroller.refreshPage();
    }

    ProductModel itemBag = homecontroller.products.where((product) => product.id.toString() == Get.parameters['id']).first;
    _product = Rx<ProductModel>(itemBag);

    if (int.parse(Get.parameters['amount'].toString()) > 0){
      _order.value = OrderProductDto(product: product, amount: int.parse(Get.parameters['amount'].toString()));
    }

    final amountBag = (order != null) ? order!.amount : 1;
    initial(amountBag, order != null);    

  }

  void initial (int amountBag, bool hasOrder) {
    _hasOrder = hasOrder;
    _amount.value = amountBag;
  }

  void incrementTap() => _amount.value = _amount.value + 1;

  void decrementTap() {
    if (_amount.value > (_hasOrder ? 0 : 1)) {
      _amount.value = _amount.value - 1;
    }
  }

}
