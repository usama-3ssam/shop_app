// ignore_for_file:
// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! ShopLoadingGetFavoritesState,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => builtFavoritesListProduct(
                  ShopCubit.get(context)
                      .favoritesModel!
                      .data!
                      .data![index]
                      .product!,
                  context),
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
                  ShopCubit.get(context).favoritesModel!.data!.data!.length,
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget builtFavoritesListProduct(
    model,
    context, {
    bool isOldPrice = true,
  }) =>
      Dismissible(
        movementDuration: const Duration(seconds: 1),
        resizeDuration: const Duration(seconds: 1),
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        child: GestureDetector(
          onTap: () {
            ShopCubit.get(context).onClickItem(model.id!);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailsScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(model.image!),
                        width: 120,
                        height: 120,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          color: Colors.red,
                          child: const Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              height: 1.3,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                model.price!.toString(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  height: 1.3,
                                  color: Colors.blue,
                                ),
                              ),
                              const Text(
                                ' LE',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  height: 1.3,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              if (model.discount != 0 && isOldPrice)
                                Text(
                                  model.oldPrice!.toString(),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    height: 1.3,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              if (model.discount != 0 && isOldPrice)
                                const Text(
                                  ' LE',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    height: 1.3,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  ShopCubit.get(context)
                                      .changeFavorites((model.id)!);
                                },
                                icon: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: ShopCubit.get(context)
                                          .favorites[(model.id)]!
                                      ? defaultColor
                                      : Colors.grey[400],
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        secondaryBackground: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red.withOpacity(.8),
            ),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: defaultColor,
                size: 100.0,
              ),
            ),
          ),
        ),
        background: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red.withOpacity(.8),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                color: defaultColor,
                size: 50.0,
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          ShopCubit.get(context).changeFavorites(model.id);
        },
      );
}
