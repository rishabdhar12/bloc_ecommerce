import 'package:bloc_ecommerce/core/utils/logger.dart';
import 'package:bloc_ecommerce/core/utils/widgets/image_card.dart';
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.9;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: MultiBlocListener(
          listeners: [
            BlocListener<RemoteCategoriesBloc, RemoteCategoriesState>(
              listenWhen: (context, state) {
                return state is CategoriesFinishedState;
              },
              listener: (context, state) {
                if (state is CategoriesFinishedState) {
                  final categories = state.categoriesEntity;
                }

                if (state is CategoriesErrorState) {
                  logger.e(state.message);
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
                  // log(products!.first.id.toString());
                }

                if (state is ProductErrorState) {
                  logger.e(state.message);
                }
              },
            )
          ],
          child: BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState>(
            builder: (context, categoriesState) {
              return BlocBuilder<RemoteProductBloc, RemoteProductState>(
                builder: (context, productState) {
                  if (categoriesState is CategoriesLoadingState ||
                      productState is ProductLoadingState) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        radius: 20,
                      ),
                    );
                  }
                  if (categoriesState is CategoriesFinishedState &&
                      productState is ProductFinishedState) {
                    // logger
                    //     .i(categoriesState.categoriesEntity!.length.toString());
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 48.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //       const Text(
                          //         "Top Categories",
                          //         style: TextStyle(
                          //             fontSize: 30, fontWeight: FontWeight.bold),
                          //       ),
                          //       GridView.builder(
                          //         physics: const NeverScrollableScrollPhysics(),
                          //         shrinkWrap: true,
                          //         gridDelegate:
                          //             SliverGridDelegateWithFixedCrossAxisCount(
                          //           childAspectRatio: (itemWidth / itemHeight),
                          //           crossAxisCount: 2,
                          //           crossAxisSpacing: 10,
                          //           mainAxisSpacing: 10,
                          //         ),
                          //         itemCount: categoriesState.categoriesEntity!.length,
                          //         itemBuilder: (context, index) {
                          //           final categories =
                          //               categoriesState.categoriesEntity;
                          //           return Text(
                          //             categories![index].name,
                          //           );
                          //         },
                          //       ),
                          //       const SizedBox(height: 40),
                          const Text(
                            "Top Products",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (itemWidth / itemHeight),
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 40,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              final products = productState.productEntity;
                              logger.i(products!.length.toString());
                              return itemCard(
                                imageUrl: products[index].images[0],
                                title: products[index].title,
                                imageHeight: 226,
                              );
                            },
                          )
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
