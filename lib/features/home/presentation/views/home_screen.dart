import 'dart:developer';

import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_state.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_bloc.dart';
import 'package:bloc_ecommerce/features/shop/presentation/bloc/product_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<RemoteCategoriesBloc, RemoteCategoriesState>(
            listenWhen: (context, state) {
              return state is CategoriesFinishedState;
            },
            listener: (context, state) {
              if (state is CategoriesFinishedState) {
                final categories = state.categoriesEntity;
                log(categories!.first.image);
              }

              if (state is CategoriesErrorState) {
                log(state.message);
              }
            },
          ),
          BlocListener<RemoteProductBloc, RemoteProductState>(
            listenWhen: (context, state) {
              return state is ProductFinishedState;
            },
            listener: (context, state) {
              if (state is ProductFinishedState) {
                final products = state.productEntity;
                log(products!.first.id.toString());
              }

              if (state is ProductErrorState) {
                log(state.message);
              }
            },
          )
        ],
        child: BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState>(
            builder: (context, state) {
          return BlocBuilder<RemoteProductBloc, RemoteProductState>(
            builder: (context, state) {
              if (state is CategoriesLoadingState ||
                  state is ProductLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                );
              }
              return const SizedBox();
            },
          );
        }),
      ),
    );
  }
}
