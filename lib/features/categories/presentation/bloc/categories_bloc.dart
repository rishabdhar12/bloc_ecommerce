import 'package:bloc_ecommerce/core/usecase/usecase.dart';
import 'package:bloc_ecommerce/features/categories/domain/usecases/categories_usecase.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_event.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCategoriesBloc
    extends Bloc<RemoteCategoriesEvent, RemoteCategoriesState> {
  final CategoriesUsecase _categoriesUsecase;

  RemoteCategoriesBloc(this._categoriesUsecase)
      : super(CategoriesInitialState()) {
    on<GetCategories>(getCategories);
  }

  void getCategories(
      GetCategories event, Emitter<RemoteCategoriesState> emit) async {
    emit(const CategoriesLoadingState());

    final response = await _categoriesUsecase(NoParams());
    response.fold(
      (failure) => emit(CategoriesErrorState(failure.message)),
      (success) => emit(CategoriesFinishedState(success)),
    );
  }
}
