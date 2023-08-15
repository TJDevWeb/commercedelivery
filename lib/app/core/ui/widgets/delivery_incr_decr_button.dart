import 'package:flutter/material.dart';

import 'package:commdelivery/app/core/ui/styles/colors_app.dart';
import 'package:commdelivery/app/core/ui/styles/text_styles.dart';

class DeliveryIncrDecrButton extends StatelessWidget {
  
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  
  const DeliveryIncrDecrButton({
    Key? key,
    this.amount = 0,
    required this.incrementTap,
    required this.decrementTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '-',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 26, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              amount.toString(),
              style: context.textStyles.textExtraBold.copyWith(fontSize: 26, color: context.colors.secondary),
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(fontSize: 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
