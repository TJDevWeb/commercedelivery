import 'package:commdelivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:commdelivery/app/core/ui/helpers/loader.dart';
import 'package:commdelivery/app/core/ui/helpers/messages.dart';
import 'package:commdelivery/app/dto/order_product_dto.dart';
import 'package:commdelivery/app/models/product_model.dart';

class ProductDetailController extends GetxController with Loader, Messages {

  final _loading = false.obs;
  final _message = Rxn<MessagesModel>();

  late final Rx<ProductModel> _product;
  ProductModel get product => _product.value;

  late final Rxn<OrderProductDto?> _order;
  OrderProductDto? get order => _order.value;

  final _amount = 1.obs;
  int get amount => _amount.value;

  late final bool _hasOrder;

  ProductDetailController();

  @override
  void onInit() {
    super.onInit();
    showLoader(_loading);
    messageListener(_message);

    if (Get.arguments == null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      _product = Rx<ProductModel>(Get.arguments['product'] as ProductModel);
      _order = Rxn<OrderProductDto?>(Get.arguments['order'] as OrderProductDto?);
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
