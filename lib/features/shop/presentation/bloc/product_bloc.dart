import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/shop/domain/usecases/product_usecase.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_event.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteProductBloc extends Bloc<RemoteProductEvent, RemoteProductState> {
  final ProductUsecase _productUsecase;

  RemoteProductBloc(this._productUsecase) : super(ProductInitialState()) {
    on<GetAllProducts>(getAllProducts);
  }

  void getAllProducts(
      GetAllProducts event, Emitter<RemoteProductState> emit) async {
    emit(const ProductLoadingState());
    final response = await _productUsecase(NoParams());
    response.fold(
      (failure) => emit(ProductErrorState(failure.message)),
      (success) => emit(ProductFinishedState(success)),
    );
  }
}
