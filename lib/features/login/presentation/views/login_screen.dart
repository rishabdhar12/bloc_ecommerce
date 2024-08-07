import 'dart:developer';

import 'package:bloc_ecommerce/core/utils/shared_preference.dart';
import 'package:bloc_ecommerce/features/login/dto/login_params.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_event.dart';
import 'package:bloc_ecommerce/features/login/presentation/blocs/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'rishab2@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '12345678');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RemoteLoginBloc>(context).add(
        UserLogin(
          loginParams: LoginParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  void saveToken({required String accessToken}) {
    SharedPreferenceHelper.saveDataSharedPreferences(
        key: "accessToken", value: accessToken);
  }

  void saveLoginState({required bool isLoggedIn}) async {
    await SharedPreferenceHelper.saveDataSharedPreferences(
        key: "isLoggedIn", value: isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              textFormField(
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                hintText: "Enter email",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              textFormField(
                controller: _passwordController,
                hintText: 'Enter Password',
                inputType: TextInputType.visiblePassword,
                obscureText: true,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              BlocConsumer<RemoteLoginBloc, RemoteLoginState>(
                listenWhen: (context, state) {
                  return state is LoginFinishedState;
                },
                listener: (context, state) {
                  if (state is LoginFinishedState) {
                    String accessToken = state.loginEntity!.user.token;
                    log("User logged in");
                    saveToken(accessToken: accessToken);
                    saveLoginState(isLoggedIn: true);
                    context.replace('/layout');
                  }
                  if (state is LoginErrorState) {
                    log(state.message);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const CupertinoActivityIndicator(
                      radius: 20,
                    );
                  }

                  return elevatedButton(
                    context,
                    title: "SUBMIT",
                    onPressed: () {
                      login();
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don't have an account?  ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go("/registration");
                        },
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 23, 7),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget elevatedButton(BuildContext context,
      {required Function() onPressed, required String title}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 23, 7),
          minimumSize: const Size(double.infinity, 56.0)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget textFormField({
    required TextEditingController controller,
    required String hintText,
    final String? Function(String?)? validate,
    required TextInputType inputType,
    bool obscureText = false,
  }) {
    return Material(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: validate,
      ),
    );
  }
}
