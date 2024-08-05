import 'package:bloc_ecommerce/core/errors/error_handler.dart';
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/shop/data/datasource/product_datasource.dart';
import 'package:bloc_ecommerce/features/shop/domain/entities/product_entity.dart';
import 'package:bloc_ecommerce/features/shop/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;
  const ProductRepositoryImpl(this._productApiService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await _productApiService.getAllProducts();
      return right(response);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}
