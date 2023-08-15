import 'package:commdelivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:commdelivery/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:commdelivery/app/pages/home/home_controller_mobile.dart'
    if (dart.library.html) 'package:commdelivery/app/pages/home/home_controller_web.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(
        elevation: .5,
      ),
      body: Column(
        children: [
          Obx(() {
            return Text(
              'Quantidade de itens no carrinho? ${controller.shoppingBag.length.toString()}',
            );
          }),
          Expanded(
            child: Obx(() {
              return RefreshIndicator(
                onRefresh: controller.refreshPage,
                child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return DeliveryProductTile(
                      product: controller.products[index],
                    );
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
