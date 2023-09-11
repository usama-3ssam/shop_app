import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/componentes.dart';

class AddressScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final detailsController = TextEditingController();
  final paymentController = DropdownEditingController<String>();

  AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextDropdownFormField(
                    controller: paymentController,
                    options: const <String>[
                      'Arabic',
                      'English',
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      prefixIcon: const Icon(Icons.language),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  controller: cityController,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city!';
                    }
                    return null;
                  },
                  onSubmit: (String? value) {
                    return null;
                  },
                  label: 'The City',
                  prefix: Icons.location_city,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  controller: regionController,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Region!';
                    }
                    return null;
                  },
                  onSubmit: (String? value) {
                    return null;
                  },
                  label: 'The Region',
                  prefix: Icons.location_city,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  controller: detailsController,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Details!';
                    }
                    return null;
                  },
                  onSubmit: (String? value) {
                    return null;
                  },
                  label: 'The Details',
                  prefix: Icons.home,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                  function: () {},
                  text: 'Add To Orders',
                  // isUpperCase: true,
                  radius: 5.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
