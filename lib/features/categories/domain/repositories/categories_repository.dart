import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
