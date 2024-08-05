import 'dart:developer';

import 'package:bloc_ecommerce/core/utils/shared_preference.dart';
import 'package:bloc_ecommerce/features/register/dto/registration_params.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_bloc.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_event.dart';
import 'package:bloc_ecommerce/features/register/presentation/bloc/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _avatarUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RemoteRegisterBloc>(context).add(
        UserRegister(
          registrationParams: RegistrationParams(
            name: _nameController.text,
            email: _emailController.text,
            avatar: _avatarUrl!,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  void saveId({required int id}) {
    SharedPreferenceHelper.saveDataSharedPreferences(key: "id", value: id);
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
                "Register",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _avatarUrl = 'https://via.placeholder.com/150';
                  });
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      _avatarUrl != null ? NetworkImage(_avatarUrl!) : null,
                  child: _avatarUrl == null
                      ? const Icon(Icons.add_a_photo, size: 40)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              textFormField(
                controller: _nameController,
                inputType: TextInputType.name,
                hintText: "Enter name",
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
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
              BlocConsumer<RemoteRegisterBloc, RemoteRegisterState>(
                listenWhen: (context, state) {
                  return state is RegisterFinishedState;
                },
                listener: (context, state) {
                  if (state is RegisterFinishedState) {
                    debugPrint("User registered");
                    int id = state.registrationEntity!.id;
                    saveId(id: id);
                    context.go("/login");
                  }
                  if (state is RegisterErrorState) {
                    log(state.message);
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return const CupertinoActivityIndicator(
                      radius: 20,
                    );
                  }

                  return elevatedButton(
                    context,
                    title: "SUBMIT",
                    onPressed: () {
                      register();
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account?  ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go("/");
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
