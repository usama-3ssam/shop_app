import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/search/search_cubit/cubit.dart';
import 'package:shop_app/search/search_cubit/states.dart';
import 'package:shop_app/shared/componentes.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter text to search';
                        }
                        return null;
                      },
                      onSubmit: (String? text) {
                        SearchCubit.get(context).search(text!);
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              builtFavoritesListProduct(
                            SearchCubit.get(context).model!.data!.data![index],
                            context,
                            isOldPrice: false,
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
                          itemCount: SearchCubit.get(context)
                              .model!
                              .data!
                              .data!
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget builtFavoritesListProduct(
    model,
    context, {
    bool isOldPrice = true,
  }) =>
      GestureDetector(
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
                        Row(
                          children: [
                            Column(
                              children: [
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (model.discount != 0 && isOldPrice)
                                      Text(
                                        model.oldPrice!.toString(),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          height: 1.3,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    if (model.discount != 0 && isOldPrice)
                                      const Text(
                                        ' LE',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          height: 1.3,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 10,
                                top: 20,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 17.0,
                                    backgroundColor: ShopCubit.get(context)
                                            .favorites[(model.id)]!
                                        ? defaultColor
                                        : Colors.grey[400],
                                    child: const Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  CircleAvatar(
                                    radius: 17.0,
                                    backgroundColor: ShopCubit.get(context)
                                            .carts[(model.id)]!
                                        ? defaultColor
                                        : Colors.grey[400],
                                    child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
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
      );
}
