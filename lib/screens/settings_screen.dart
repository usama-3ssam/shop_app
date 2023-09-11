import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/componentes.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return Scaffold(
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).userModel != null,
            builder: (context) => Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 20.0,
                    start: 20.0,
                    bottom: 50.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is ShopLoadingUpdateUserState)
                          const LinearProgressIndicator(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // const CircleAvatar(
                        //   radius: 60,
                        //   backgroundImage: NetworkImage(
                        //     'https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/275966824_1503380736724358_4342121518919894903_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=NMcgGuZ-ptwAX-8ySrE&_nc_ht=scontent.fcai21-1.fna&oh=00_AT9dHsIRVIZF1XgWRI5YL8ySG5XAfdyIWJTJWVbNmkM3AQ&oe=624DBD8B',
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Name must not be null!!';
                            }
                            return null;
                          },
                          onSubmit: (String? value) {
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email must not be null!!';
                            }
                            return null;
                          },
                          onSubmit: (String? value) {
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Phone must not be null!!';
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
                          height: 20.0,
                        ),
                        defaultButton(
                          background: defaultColor,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).updateUserDate(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                              );
                            }
                          },
                          text: 'UPDATE',
                          radius: 5.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          background: defaultColor,
                          function: () {
                            signOut(context);
                          },
                          text: 'Logout',
                          radius: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
