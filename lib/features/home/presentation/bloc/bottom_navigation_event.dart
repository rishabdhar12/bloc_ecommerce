import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class HomeEvent extends BottomNavigationEvent {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ShopEvent extends BottomNavigationEvent {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class CartEvent extends BottomNavigationEvent {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class WishlistEvent extends BottomNavigationEvent {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class ProfileEvent extends BottomNavigationEvent {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
