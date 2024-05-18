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

  sl.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));

  // Blocs
  sl.registerFactory<RemoteRegisterBloc>(() => RemoteRegisterBloc(sl()));
}
