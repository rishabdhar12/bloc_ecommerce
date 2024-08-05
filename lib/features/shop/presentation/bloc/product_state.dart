import 'package:bloc_ecommerce/features/shop/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteProductState extends Equatable {
  final List<ProductEntity>? productEntity;

  const RemoteProductState({this.productEntity});

  @override
  List<Object> get props => [productEntity!];
}

class ProductInitialState extends RemoteProductState {}

class ProductLoadingState extends RemoteProductState {
  const ProductLoadingState();
}

class ProductFinishedState extends RemoteProductState {
  const ProductFinishedState(List<ProductEntity> productEntity)
      : super(productEntity: productEntity);
}

class ProductErrorState extends RemoteProductState {
  final String message;
  const ProductErrorState(this.message);

  @override
  List<Object> get props => [message];
}
