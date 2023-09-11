// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/register/register_cubit/cubit.dart';
import 'package:shop_app/register/register_cubit/states.dart';
import 'package:shop_app/shared/componentes.dart';
import 'package:shop_app/shared/constants.dart';

import '../shop_app/shop_layout.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessStates) {
            if (state.loginModel.status!) {
              print(state.loginModel.massage);
              print(state.loginModel.data!.token);

              CacheHelper.saveDate(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopLayout(),
                  ),
                  (Route<dynamic> route) => false,
                );
              });
            } else {
              print(state.loginModel.massage);
              showToast(
                text: state.loginModel.massage!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w900,
                            color: defaultColor
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        const Text(
                          'Register now to browse our hot offers!',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name!';
                            }
                            return null;
                          },
                          onSubmit: (String? value) {
                            return null;
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address!';
                            }
                            return null;
                          },
                          onSubmit: (String? value) {
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please is to shot!';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone!';
                            }
                            return null;
                          },
                          onSubmit: (String? value) {
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Register',
                            isUpperCase: true,
                            radius: 5.0,
                            background: defaultColor
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
