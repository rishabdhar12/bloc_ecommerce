import 'package:bloc_ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteCategoriesState extends Equatable {
  final List<CategoryEntity>? categoriesEntity;

  const RemoteCategoriesState({this.categoriesEntity});

  @override
  List<Object> get props => [categoriesEntity!];
}

class CategoriesInitialState extends RemoteCategoriesState {}

class CategoriesLoadingState extends RemoteCategoriesState {
  const CategoriesLoadingState();
}

class CategoriesFinishedState extends RemoteCategoriesState {
  const CategoriesFinishedState(List<CategoryEntity> categoriesEntity)
      : super(categoriesEntity: categoriesEntity);
}

class CategoriesErrorState extends RemoteCategoriesState {
  final String message;
  const CategoriesErrorState(this.message);
}
