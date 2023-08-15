import 'package:commdelivery/app/models/product_model.dart';

class OrderProductDto {
  
  final ProductModel product;
  final int amount; 

  OrderProductDto({
    required this.product,
    this.amount = 0,
  });

  double get totalPrice => amount * product.price;
  
  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'amount': amount,
    };
  }

  factory OrderProductDto.fromMap(Map<String, dynamic> map) {
    return OrderProductDto(
      product: ProductModel.fromMap(map['product']),
      amount: map['amount'],
    );
  }
}
