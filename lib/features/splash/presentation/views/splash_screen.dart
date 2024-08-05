import 'package:bloc_ecommerce/core/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkUserLoginStatus();
    super.initState();
  }

  void _checkUserLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await SharedPreferenceHelper.getDataFromSharedPreferences(
            key: 'isLoggedIn') ??
        false;

    // log(isLoggedIn!);

    if (isLoggedIn) {
      context.replace('/layout');
    } else {
      context.replace('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splash.json'),
      ),
    );
  }
}
