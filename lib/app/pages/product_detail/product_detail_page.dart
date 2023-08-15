import 'package:auto_size_text/auto_size_text.dart';
import 'package:commdelivery/app/core/config/env/env.dart';
import 'package:commdelivery/app/core/extensions/formatter_extension.dart';
import 'package:commdelivery/app/dto/order_product_dto.dart';
import 'package:commdelivery/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:commdelivery/app/core/ui/helpers/size_extensions.dart';
import 'package:commdelivery/app/core/ui/styles/text_styles.dart';
import 'package:commdelivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:commdelivery/app/core/ui/widgets/delivery_incr_decr_button.dart';
import 'package:commdelivery/app/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(
        elevation: .5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  '${Env.i['backend_base_url'] ?? ''}/${controller.product.image}'),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.product.name,
              style: context.textStyles.textExtraBold.copyWith(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  controller.product.description,
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: context.percentWidth(.48),
                  height: 68,
                  padding: const EdgeInsets.all(2.0),
                  child: Obx(
                    () {
                      return DeliveryIncrDecrButton(
                        amount: controller.amount,
                        incrementTap: () {
                          controller.incrementTap();
                        },
                        decrementTap: () {
                          controller.decrementTap();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: context.percentWidth(.01),
                ),
                Container(
                  width: context.percentWidth(.48),
                  height: 68,
                  padding: const EdgeInsets.all(2.0),
                  child: Obx(() {
                    return ElevatedButton(
                      style: controller.amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        Get.offAndToNamed(Routes.HOME,
                            result: OrderProductDto(
                                product: controller.product,
                                amount: controller.amount));
                      },
                      child: Visibility(
                        visible: controller.amount > 0,
                        replacement: Text(
                          'EXCLUIR PRODUTO?',
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ADICIONAR',
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 0,
                              child: AutoSizeText(
                                (controller.product.price * controller.amount)
                                    .currencyPTBR,
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                style: context.textStyles.textExtraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
