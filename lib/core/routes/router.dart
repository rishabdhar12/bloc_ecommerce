import 'package:bloc_ecommerce/features/login/presentation/views/login_screen.dart';
import 'package:bloc_ecommerce/features/register/presentation/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginForm();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'registration',
          builder: (BuildContext context, GoRouterState state) {
            return const RegistrationForm();
          },
        ),
      ],
    ),
  ],
);
