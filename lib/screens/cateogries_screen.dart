import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildCatItem(
              ShopCubit.get(context).categoriesModels!.data!.data[index],
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
            ),
            itemCount:
                ShopCubit.get(context).categoriesModels!.data!.data.length,
          ),
        );
      },
    );
  }

  Widget buildCatItem(
    DataModel model,
  ) =>
      Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                model.image,
              ),
              height: 120,
              width: 120,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              model.name!,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: defaultColor,
            )
          ],
        ),
      );
}
