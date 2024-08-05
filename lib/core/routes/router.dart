import 'package:bloc_ecommerce/features/cart/presentation/views/cart_screen.dart';
import 'package:bloc_ecommerce/features/home/presentation/views/home_screen.dart';
import 'package:bloc_ecommerce/features/home/presentation/views/layout.dart';
import 'package:bloc_ecommerce/features/login/presentation/views/login_screen.dart';
import 'package:bloc_ecommerce/features/profile/presentation/views/profile_screen.dart';
import 'package:bloc_ecommerce/features/register/presentation/views/registration_screen.dart';
import 'package:bloc_ecommerce/features/shop/presentation/views/shop_screen.dart';
import 'package:bloc_ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:bloc_ecommerce/features/wishlist/presentation/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginForm();
          },
        ),
        GoRoute(
          path: 'registration',
          builder: (BuildContext context, GoRouterState state) {
            return const RegistrationForm();
          },
        ),
        GoRoute(
          path: 'layout',
          builder: (BuildContext context, GoRouterState state) {
            return const LayoutPage();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'shop',
          builder: (BuildContext context, GoRouterState state) {
            return const ShopScreen();
          },
        ),
        GoRoute(
          path: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartScreen();
          },
        ),
        GoRoute(
          path: 'wishlist',
          builder: (BuildContext context, GoRouterState state) {
            return const WishlistScreen();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ],
);
