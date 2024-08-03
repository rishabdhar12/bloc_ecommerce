import 'package:bloc_ecommerce/features/categories/data/datasource/categories_datasource.dart';
import 'package:bloc_ecommerce/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:bloc_ecommerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:bloc_ecommerce/features/categories/domain/usecases/categories_usecase.dart';
import 'package:bloc_ecommerce/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:bloc_ecommerce/features/home/presentation/bloc/bottom_navigation_bloc.dart';
import 'package:bloc_ecommerce/features/login/data/datasource/login_datasource.dart';
import 'package:bloc_ecommerce/features/login/data/repositories/login_repository_impl.dart';
import 'package:bloc_ecommerce/features/login/domain/repositories/login_repository.dart';
import 'package:bloc_ecommerce/features/login/domain/usecase/login_usecase.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_ecommerce/features/register/data/datasources/remote/register_datasource.dart';
import 'package:bloc_ecommerce/features/register/data/repository/register_repository_impl.dart';
import 'package:bloc_ecommerce/features/register/domain/repositories/register_repository.dart';
import 'package:bloc_ecommerce/features/register/domain/usecases/register_usecase.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));
  sl.registerSingleton<LoginApiService>(LoginApiService(sl()));
  sl.registerSingleton<CategoriesApiService>(CategoriesApiService(sl()));

  sl.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(sl()));
  sl.registerSingleton<LoginRepository>(LoginRepositoryImpl(sl()));
  sl.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<CategoriesUsecase>(CategoriesUsecase(sl()));

  // Blocs
  sl.registerFactory<RemoteRegisterBloc>(() => RemoteRegisterBloc(sl()));
  sl.registerFactory<RemoteLoginBloc>(() => RemoteLoginBloc(sl()));
  sl.registerFactory<BottomNavigationBloc>(() => BottomNavigationBloc());
  sl.registerFactory<RemoteCategoriesBloc>(() => RemoteCategoriesBloc(sl()));
}
