import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/shop/domain/entities/product_entity.dart';
import 'package:bloc_ecommerce/features/shop/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductUsecase extends BaseUsecase<List<ProductEntity>, NoParams> {
  final ProductRepository _productRepository;

  ProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await _productRepository.getAllProducts();
  }
}
