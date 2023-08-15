import 'dart:convert';
import 'dart:developer';

import 'package:commdelivery/app/core/global/constants.dart';
import 'package:commdelivery/app/core/storage/session_storage.dart';
import 'package:commdelivery/app/dto/order_product_dto.dart';
import 'package:commdelivery/app/repositories/products/products_repository_impl.dart';
import 'package:commdelivery/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:commdelivery/app/core/ui/helpers/loader.dart';
import 'package:commdelivery/app/core/ui/helpers/messages.dart';
import 'package:commdelivery/app/models/product_model.dart';

class HomeController extends GetxController with Loader, Messages {
  final _loading = false.obs;
  final _message = Rxn<MessagesModel>();

  final ProductsRepositoryImpl _productsRepository;
  final SessionStorage _storage;

  final products = <ProductModel>[].obs;

  final _shoppingBag = RxList<OrderProductDto>();
  RxList<OrderProductDto> get shoppingBag => _shoppingBag;

  HomeController(
    this._productsRepository,
    this._storage,
  );

  @override
  void onInit() {
    super.onInit();
    showLoader(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading(true);
      await loadProducts();
      if (_shoppingBag.isEmpty) {
        final orderSession = _storage.getData(SessionStorageKeys.shoppingBag.key);
        if (orderSession.isNotEmpty) {
          final orderJson = jsonDecode(orderSession);
          for (var e in orderJson) {
            _shoppingBag.add(OrderProductDto.fromMap(e));
          }
        }
      }
      _loading(false);
    } catch (e, s) {
      _loading(false);
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _message(MessagesModel(
          title: 'Erro',
          message: 'Erro ao carregar produtos.',
          type: MessageType.error));
    }
  }

  Future<void> loadProducts() async {
    final data = await _productsRepository.findAllProducts();
    products.assignAll(data);
  }

  Future<void> refreshPage() async {
    try {
      await loadProducts();
    } catch (e, s) {
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _message(MessagesModel(
          title: 'Erro',
          message: 'Erro ao carregar produtos.',
          type: MessageType.error));
    }
  }

  Future<void> detailPage(ProductModel product) async {
    OrderProductDto? orders =
        shoppingBag.where((order) => order.product == product).firstOrNull;
    final orderProduct = await Get.toNamed(Routes.DETAILS, arguments: {
      'product': product,
      'order': orders,
    });
    if (orderProduct != null) {
      //como delivery_product_title é apenas um widget não criamos binding nem controller
      //buscamos o HomeController atraves do Get.find()
      addOrUpdateBag(orderProduct as OrderProductDto);
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final bag = [..._shoppingBag]; //faz uma cópia da lista observável
    final orderIndex =
        bag.indexWhere((order) => order.product == orderProduct.product);
    if (orderProduct.amount == 0) {
      bag.removeAt(orderIndex);
    } else {
      if (orderIndex > -1) {
        bag[orderIndex] = orderProduct; //atualiza item na copia
      } else {
        bag.add(orderProduct); //adiciona novo item na cópia
      }
    }
    final listOrder = [];
    for (var e in bag) {
      listOrder.add(e.toMap());
    }
    print(listOrder);
    _shoppingBag.value = bag;
    _storage.setData(
      SessionStorageKeys.shoppingBag.key,
      json.encode(listOrder),
    ); //atualiza a lista observável
  }
}
