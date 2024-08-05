import 'package:bloc_ecommerce/features/cart/presentation/views/cart_screen.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_event.dart';
import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_bloc.dart';
import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_event.dart';
import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_state.dart';
import 'package:bloc_ecommerce/features/home/presentation/views/home_screen.dart';
import 'package:bloc_ecommerce/features/profile/presentation/views/profile_screen.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_bloc.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_event.dart';
import 'package:bloc_ecommerce/features/shop/presentation/views/shop_screen.dart';
import 'package:bloc_ecommerce/features/wishlist/presentation/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    BlocProvider.of<RemoteCategoriesBloc>(context).add(const GetCategories());
    BlocProvider.of<RemoteProductBloc>(context).add(const GetAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              currentIndex: state.index,
              onTap: (index) {
                switch (index) {
                  case 0:
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add((const HomeEvent()));
                  case 1:
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add((const ShopEvent()));
                  case 2:
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add((const CartEvent()));
                    break;
                  case 3:
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add((const WishlistEvent()));
                    break;
                  case 4:
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add((const ProfileEvent()));
                    break;
                  default:
                    const Placeholder();
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Shop',
                    activeIcon: Icon(Icons.shopping_cart)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: 'Cart',
                    activeIcon: Icon(Icons.shopping_bag)),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Wishlist',
                  activeIcon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                    activeIcon: Icon(Icons.person)),
              ],
            ),
            body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                if (state is HomeState) {
                  return const HomeScreen();
                } else if (state is ShopState) {
                  return const ShopScreen();
                } else if (state is CartState) {
                  return const CartScreen();
                } else if (state is WishlistState) {
                  return const WishlistScreen();
                } else if (state is ProfileState) {
                  return const ProfileScreen();
                } else {
                  return const SizedBox();
                }
              },
            ));
      },
    );
  }
}
