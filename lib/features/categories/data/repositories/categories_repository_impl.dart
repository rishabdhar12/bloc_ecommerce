import 'package:bloc_ecommerce/core/errors/error_handler.dart';
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/categories/data/datasource/categories_datasource.dart';
import 'package:bloc_ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:bloc_ecommerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:fpdart/fpdart.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesApiService _categoriesApiService;

  const CategoriesRepositoryImpl(this._categoriesApiService);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await _categoriesApiService.getCategories();
      return right(response);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}
