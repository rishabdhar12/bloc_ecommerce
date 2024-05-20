import 'package:bloc_ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:bloc_ecommerce/core/routes/router.dart';
import 'package:bloc_ecommerce/core/utils/shared_preference.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SharedPreferenceHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<RemoteRegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<RemoteLoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Ecommerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
