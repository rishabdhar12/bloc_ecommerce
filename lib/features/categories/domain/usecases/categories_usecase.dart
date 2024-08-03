// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_ecommerce/core/errors/failure.dart';
import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:bloc_ecommerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:fpdart/fpdart.dart';

class CategoriesUsecase extends BaseUsecase<List<CategoryEntity>, NoParams> {
  final CategoriesRepository _categoriesRepository;

  CategoriesUsecase(this._categoriesRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await _categoriesRepository.getCategories();
  }
}
