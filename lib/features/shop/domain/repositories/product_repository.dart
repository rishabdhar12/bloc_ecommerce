import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/shop/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
