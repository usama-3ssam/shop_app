// ignore_for_file: avoid_print
// ignore_for_file:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/shared/componentes.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessFavoritesState) {
          if (!state.model.status!) {
            showToast(
              text: state.model.message!,
              state: ToastState.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModels != null,
            builder: (context) => productsBuilder(
                ShopCubit.get(context).homeModel,
                ShopCubit.get(context).categoriesModels,
                context),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget productsBuilder(
          HomeModel? model, CategoriesModels? categoriesModels, context) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model!.data.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage(e['image']),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCategoriesItem(
                          categoriesModels!.data!.data[index], context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10.0,
                      ),
                      itemCount: categoriesModels!.data!.data.length,
                    ),
                  ),
                  const Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.7,
                children: List.generate(
                  model.data.products.length,
                  (index) =>
                      buildGridProduct(model.data.products[index], context),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCategoriesItem(DataModel model, context) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 100,
            width: 100,
          ),
          Container(
            width: 100,
            color: Colors.black.withOpacity(.8),
            child: Text(
              model.name!,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  Widget buildGridProduct(
    model,
    context,
  ) =>
      GestureDetector(
        onTap: () {
          ShopCubit.get(context).onClickItem(model['id']);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailsScreen(),
            ),
          );
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model['image']!),
                    width: double.infinity,
                    height: 200,
                  ),
                  if (model['discount'] != 0)
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model['name']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${model['price']!}',
                          style: const TextStyle(
                            fontSize: 12.0,
                            height: 1.3,
                            color: Colors.blue,
                          ),
                        ),
                        const Text(
                          ' LE',
                          style: TextStyle(
                            fontSize: 11.0,
                            height: 1.3,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (model['discount'] != 0)
                          Text(
                            '${model['old_price']!}',
                            style: const TextStyle(
                              fontSize: 10.0,
                              height: 1.3,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        if (model['discount'] != 0)
                          const Text(
                            ' LE',
                            style: TextStyle(
                              fontSize: 11.0,
                              height: 1.3,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ShopCubit.get(context)
                                .changeFavorites(model['id']!);
                          },
                          icon: CircleAvatar(
                            radius: 14.0,
                            backgroundColor:
                                ShopCubit.get(context).favorites[(model['id'])]!
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
            ],
          ),
        ),
      );
}
