import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  final int index = 0;
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class HomeState extends BottomNavigationState {
  const HomeState();

  @override
  final int index = 0;
  final String title = "Home";

  @override
  List<Object> get props => [index, title];
}

class ShopState extends BottomNavigationState {
  const ShopState();

  @override
  final int index = 1;
  final String title = "Shop";

  @override
  List<Object> get props => [index, title];
}

class CartState extends BottomNavigationState {
  const CartState();

  @override
  final int index = 2;
  final String title = "Cart";

  @override
  List<Object> get props => [index, title];
}

class WishlistState extends BottomNavigationState {
  const WishlistState();

  @override
  final int index = 3;
  final String title = "Wishlist";

  @override
  List<Object> get props => [index, title];
}

class ProfileState extends BottomNavigationState {
  const ProfileState();

  @override
  final int index = 4;
  final String title = "Profile";

  @override
  List<Object> get props => [index, title];
}
