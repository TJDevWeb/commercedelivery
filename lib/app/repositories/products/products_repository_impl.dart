import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:commdelivery/app/core/exceptions/repository_exception.dart';
import 'package:commdelivery/app/models/product_model.dart';
import './products_repository.dart';

import 'package:commdelivery/app/core/rest_client/custom_dio_native.dart'
if (dart.library.html) 'package:commdelivery/app/core/rest_client/custom_dio_web.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  
  final CustomDio dio;
  
  ProductsRepositoryImpl({
    required this.dio,
  });
  
  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }

}
