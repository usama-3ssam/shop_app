// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/register/register_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/screens/products_screen.dart';
import 'package:shop_app/shared/componentes.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_layout.dart';
import 'login_cubit/cubit.dart';
import 'login_cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
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
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductsScreen()));
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: defaultColor),
                  ),
                ),
              ],
            ),
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
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w900,
                              color: defaultColor),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        const Text(
                          'Login now to browse our hot offers!',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
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
                              return 'Please enter your Password!';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            ShopLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: ShopLoginCubit.get(context).suffix,
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingStates,
                          builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'LOGIN',
                              isUpperCase: true,
                              radius: 5.0,
                              background: defaultColor),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account ? '),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: const Text(
                                'REGISTER',
                                style: TextStyle(
                                    fontSize: 17.0, color: defaultColor),
                              ),
                            ),
                          ],
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
// usamaessam@gmail.com
// 2311479ons
