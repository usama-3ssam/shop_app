// ignore_for_file:
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_app_cubit/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => builtCartListProduct(
                ShopCubit.get(context).cartModel!.data!.cartItems[index],
                context,
                index),
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
            itemCount: ShopCubit.get(context).cartModel!.data!.cartItems.length,
          ),
        );
      },
    );
  }

  Widget builtCartListProduct(
    model,
    context,
    index, {
    bool isOldPrice = true,
  }) =>
      Dismissible(
        movementDuration: const Duration(seconds: 1),
        resizeDuration: const Duration(seconds: 1),
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        child: GestureDetector(
          onTap: () {
            ShopCubit.get(context).onClickItem(model['product']['id']);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailsScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(model['product']['image']),
                        width: 120,
                        height: 120,
                      ),
                      if (model['product']['discount'] != 0 && isOldPrice)
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
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  model['product']['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      model['product']['price'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      ' LE',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 17.0,
                        color: Colors.blue,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ShopCubit.get(context)
                            .changeCarts(model['product']['id']!);
                      },
                      icon: const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: defaultColor,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (ShopCubit.get(context).cartModel!.data!.cartItems.length -
                        1 ==
                    index)
                  if (ShopCubit.get(context)
                          .cartModel!
                          .data!
                          .cartItems
                          .length !=
                      1)
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60.0,
                              ),
                              child: Container(
                                color: Colors.grey,
                                height: 1,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Total Price: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25.0,
                                    color: Colors.blue,
                                    height: 1.3,
                                  ),
                                ),
                                Text(
                                  ShopCubit.get(context)
                                      .cartModel!
                                      .data!
                                      .total
                                      .round()
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    height: 1.3,
                                  ),
                                ),
                                const Text(
                                  ' LE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                    color: Colors.blue,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                          ],
                        )),
              ],
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
                size: 100.0,
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          ShopCubit.get(context).changeCarts(model['product']['id']);
        },
      );
}
