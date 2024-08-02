import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_event.dart';
import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const HomeState()) {
    on<HomeEvent>(onLoadHome);
    on<ShopEvent>(onLoadShop);
    on<CartEvent>(onLoadCart);
    on<WishlistEvent>(onLoadWishlist);
    on<ProfileEvent>(onLoadProfile);
  }

  void onLoadHome(HomeEvent event, Emitter<BottomNavigationState> emit) async {
    emit(const HomeState());
  }

  void onLoadShop(ShopEvent event, Emitter<BottomNavigationState> emit) async {
    emit(const ShopState());
  }

  void onLoadCart(CartEvent event, Emitter<BottomNavigationState> emit) async {
    emit(const CartState());
  }

  void onLoadWishlist(
      WishlistEvent event, Emitter<BottomNavigationState> emit) async {
    emit(const WishlistState());
  }

  void onLoadProfile(
      ProfileEvent event, Emitter<BottomNavigationState> emit) async {
    emit(const ProfileState());
  }
}
