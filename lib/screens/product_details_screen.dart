// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/search/search_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var imageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: const [
                Text(
                  'Salla',
                  style: TextStyle(color: defaultColor),
                ),
                Icon(
                  Icons.shopping_cart,
                  color: defaultColor,
                  size: 18,
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
            ],
          ),
          body: buildProductDetailsItem(
              cubit.homeModel!.data.products[cubit.index!], context),
        );
      },
    );
  }

  Widget buildProductDetailsItem(model, context) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      SizedBox(
                        height: 250.0,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Image(
                            image: NetworkImage(model['images'][index]),
                            width: double.infinity,
                            height: 300,
                          ),
                          itemCount: model['images'].length,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model['id']!);
                          setState(() {
                            ShopCubit.get(context).favorites[(model['id'])]!
                                ? defaultColor
                                : Colors.grey[400];
                          });
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
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
                  if (model['discount'] != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.red,
                      child: const Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 10,
                  start: 10,
                  top: 10,
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Id of Product : ${model['id']}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                height: 1.3,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Description of Product :',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue,
                              ),
                            ),
                            ReadMoreText(
                              model['description'].toString().toLowerCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              trimLines: 8,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'show more',
                              trimExpandedText: 'less',
                              colorClickableText: defaultColor,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price of Product : ${model['price']}',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    height: 1.3,
                                    color: Colors.blue,
                                  ),
                                ),
                                const Text(
                                  ' LE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                if (model['discount'] != 0)
                                  Text(
                                    '${model['old_price']!} LE',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      height: 1.3,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  ShopCubit.get(context)
                                      .changeCarts(model['id']!);
                                },
                                label:
                                    ShopCubit.get(context).carts[model['id']]!
                                        ? const Text(
                                            'REMOVE FROM CARTS',
                                            style: TextStyle(
                                              color: defaultColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : const Text(
                                            'ADD TO CARTS',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                icon: ShopCubit.get(context).carts[model['id']]!
                                    ? const Icon(
                                        Icons.remove_shopping_cart,
                                        color: defaultColor,
                                        size: 15,
                                      )
                                    : const Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                backgroundColor:
                                    ShopCubit.get(context).carts[model['id']]!
                                        ? Colors.grey[400]
                                        : defaultColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
