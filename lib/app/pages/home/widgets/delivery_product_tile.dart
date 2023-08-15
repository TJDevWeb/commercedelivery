import 'package:commdelivery/app/pages/home/home_controller_mobile.dart'
if (dart.library.html) 'package:commdelivery/app/pages/home/home_controller_web.dart';
import 'package:commdelivery/app/core/config/env/env.dart';
import 'package:commdelivery/app/core/extensions/formatter_extension.dart';
import 'package:commdelivery/app/core/ui/styles/colors_app.dart';
import 'package:commdelivery/app/core/ui/styles/text_styles.dart';
import 'package:commdelivery/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return InkWell(
      onTap: () async {
        controller.detailPage(product);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textBold.copyWith(
                          fontSize: 14, color: context.colors.secondary),
                    ),
                  )
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: '${Env.i['backend_base_url'] ?? ''}/${product.image}',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
