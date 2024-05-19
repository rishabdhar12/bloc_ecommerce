import 'package:bloc_ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_bloc.dart';
import 'package:bloc_ecommerce/features/register/presentation/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
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
      ],
      child: MaterialApp(
        title: 'Flutter Ecommerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const RegistrationForm(),
      ),
    );
  }
}
