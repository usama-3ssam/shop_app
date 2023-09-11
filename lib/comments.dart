int x1 = 1;
// if (ShopCubit.get(context).carts['id']! !=
//     true)
//   Container(
//     alignment: Alignment.bottomCenter,
//     child: FloatingActionButton.extended(
//       onPressed: () {
//         ShopCubit.get(context).changeCarts(model['id']!);
//         print(ShopCubit.get(context)
//             .cartModel!
//             .status);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 const CartScreen(),
//           ),
//         );
//       },
//       label: const Text(
//         'Remove CART',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       icon: const Icon(
//         Icons.remove_shopping_cart,
//         color: Colors.white,
//       ),
//       backgroundColor: Colors.grey.withOpacity(.7),
//     ),
//   ),
int x2 = 2;
// backgroundColor: cubit.carts[cubit.homeModel!.data!.products[cubit.index!]['id']]! ? Colors.blue : Colors.grey,
int x3 = 3;
// print(ShopCubit.get(context).cartModel!.status);
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) =>  const CartScreen(),
//   ),
// );
int x4 = 4;
// if backgroundColor: cubit.carts[cubit.homeModel!.data!.products[cubit.index!]['id']]! ? defaultColor : Colors.grey,
// if backgroundColor: ShopCubit.get(context).carts[ShopCubit.get(context).carts.homeModel!.data!.products[ShopCubit.get(context).carts.index!]['id']]! ? defaultColor : Colors.grey,
int x5 = 5;
// backgroundColor: cubit.carts[cubit.homeModel!.data!.products[cubit.index!]['id']]! ? defaultColor : Colors.grey,
int x = 5;
// Padding(
//   padding: const EdgeInsetsDirectional.only(
//     top: 5.0,
//   ),
//   child: Column(
//     children: [
//       SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             Container(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     FloatingActionButton(
//                       onPressed: () {
//                         ShopCubit.get(context).minus();
//                       },
//                       heroTag: 'minus-',
//                       mini: true,
//                       child: const Icon(
//                         Icons.remove,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 2,
//                     ),
//                     Text(
//                       '${ShopCubit.get(context).counter}',
//                       style: const TextStyle(
//                         fontSize: 35.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 2,
//                     ),
//                     FloatingActionButton(
//                         onPressed: () {
//                           ShopCubit.get(context).plus();
//                         },
//                         heroTag: 'plus+',
//                         mini: true,
//                         child: const Text(
//                           '+',
//                           style: TextStyle(
//                             fontSize: 35.0,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10.0,
//             ),
//             Container(
//               child: Row(
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       ShopCubit.get(context).changeColors(
//                         ShopCubit.get(context).currentColor,
//                       );
//                     },
//                     heroTag: 'red',
//                     mini: true,
//                     child: const CircleAvatar(
//                       radius: 17,
//                       backgroundColor: Colors.red,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 2.0,
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       ShopCubit.get(context).changeColors(
//                         ShopCubit.get(context).currentColor,
//                       );
//                     },
//                     heroTag: 'white',
//                     mini: true,
//                     child: const CircleAvatar(
//                       radius: 17,
//                       backgroundColor: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 2.0,
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       ShopCubit.get(context).changeColors(
//                         ShopCubit.get(context).currentColor,
//                       );
//                     },
//                     heroTag: 'black',
//                     mini: true,
//                     child: const CircleAvatar(
//                       radius: 17,
//                       backgroundColor: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 2.0,
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       ShopCubit.get(context).changeColors(
//                         ShopCubit.get(context).currentColor,
//                       );
//                     },
//                     heroTag: 'gray',
//                     mini: true,
//                     child: CircleAvatar(
//                       radius: 17,
//                       backgroundColor: Colors.grey[800],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 5.0,
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.only(
//           start: 20.0,
//           end: 10.0,
//         ),
//         child: Container(
//           width: double.infinity,
//           child: Row(
//             children: [
//               Column(
//                 children: [
//                   const Text(
//                     'Quantity of Product :',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   Text(
//                     '${ShopCubit.get(context).counter} Items',
//                     style: const TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 width: 65.0,
//               ),
//               Column(
//                 children: [
//                   const Text(
//                     'Color of Product is :',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   Text(
//                     '${ShopCubit.get(context).currentColor}',
//                     style: const TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
int x6 = 6;
// ListTile(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => const ShopLayout()),
//     );
//   },
//   title: const Text('Home'),
//   leading: const Icon(Icons.home),
// ),
// ListTile(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => const CategoriesScreen()),
//     );
//   },
//   title: const Text('Categories'),
//   leading: const Icon(
//     Icons.apps,
//   ),
// ),
// ListTile(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const FavoritesScreen(),
//       ),
//     );
//   },
//   title: const Text('Favorite'),
//   leading: const Icon(Icons.favorite),
// ),
// ListTile(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SettingsScreen()),
//     );
//   },
//   title: const Text('Settings'),
//   leading: const Icon(Icons.settings),
// ),
int x7 = 7;
// import 'package:flutter/material.dart';
// import '../layout/cubit/cubit.dart';
// import '../shared/components/components.dart';
// import '../shared/components/constant.dart';
// import 'getCarts/GetCarts.dart';
//
// class NavigationDrawerWidget extends StatelessWidget {
//   final padding = const EdgeInsets.symmetric(horizontal: 10);
//
//   const NavigationDrawerWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var model = ShopCubit.get(context).userModel;
//     final name = model!.data!.name;
//     final email = model.data!.email;
//     const urlImage = 'assets/on_boarding.jpg';
//
//     return Drawer(
//       child: Material(
//         color: const Color.fromARGB(255, 1, 6, 31),
//         child: ListView(
//           children: <Widget>[
//             buildHeader(
//                 urlImage: urlImage,
//                 name: name!,
//                 email: email!,
//                 onClicked: () {}),
//             Container(
//               padding: padding,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 12),
//                   buildSearchField(),
//                   const SizedBox(height: 24),
//                   buildMenuItem(
//                     text: 'Home',
//                     icon: Icons.home,
//                     onClicked: () => selectedItem(context, 1),
//                   ),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                       text: 'Carts',
//                       icon: Icons.add_shopping_cart_outlined,
//                       onClicked: () => navigateTo(context, const GetCarts())),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                     text: 'Favourites',
//                     icon: Icons.favorite_border,
//                     onClicked: () => selectedItem(context, 1),
//                   ),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                     text: 'Workflow',
//                     icon: Icons.workspaces_outline,
//                     onClicked: () => selectedItem(context, 2),
//                   ),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                     text: 'Updates',
//                     icon: Icons.update,
//                     onClicked: () => selectedItem(context, 3),
//                   ),
//                   const SizedBox(height: 24),
//                   const Divider(color: Colors.white70),
//                   const SizedBox(height: 24),
//                   buildMenuItem(
//                     text: 'Plugins',
//                     icon: Icons.account_tree_outlined,
//                     onClicked: () => selectedItem(context, 4),
//                   ),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                     text: 'Notifications',
//                     icon: Icons.notifications_outlined,
//                     onClicked: () => selectedItem(context, 5),
//                   ),
//                   const SizedBox(height: 16),
//                   buildMenuItem(
//                     text: 'Logout',
//                     icon: Icons.logout_rounded,
//                     onClicked: () => SignOut(context),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildHeader({
//     required String urlImage,
//     required String name,
//     required String email,
//     required VoidCallback onClicked,
//   }) =>
//       InkWell(
//         onTap: onClicked,
//         child: Container(
//           padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
//           child: Row(
//             children: [
//               CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
//               const SizedBox(width: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     email,
//                     style: const TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       );
//
//   Widget buildSearchField() {
//     const color = Colors.white;
//
//     return TextField(
//       style: const TextStyle(color: color),
//       decoration: InputDecoration(
//         contentPadding:
//         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         hintText: 'Search',
//         hintStyle: const TextStyle(color: color),
//         prefixIcon: const Icon(Icons.search, color: color),
//         filled: true,
//         fillColor: Colors.white12,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: color.withOpacity(0.7)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: color.withOpacity(0.7)),
//         ),
//       ),
//     );
//   }
//
//   Widget buildMenuItem({
//     required String text,
//     required IconData icon,
//     VoidCallback? onClicked,
//   }) {
//     const color = Colors.white;
//     const hoverColor = Colors.white70;
//
//     return ListTile(
//       leading: Icon(icon, color: color),
//       title: Text(text, style: const TextStyle(color: color)),
//       hoverColor: hoverColor,
//       onTap: onClicked,
//     );
//   }
//
//   void selectedItem(BuildContext context, int index) {
//     Navigator.of(context).pop();
//   }
// }
int x8 = 8;
// Widget buildSearchField() {
//   const color = Colors.white;
//
//   return TextField(
//     style: const TextStyle(color: color),
//     decoration: InputDecoration(
//       contentPadding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       hintText: 'Search',
//       hintStyle: const TextStyle(color: color),
//       prefixIcon: const Icon(Icons.search, color: color),
//       filled: true,
//       fillColor: Colors.white12,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(5),
//         borderSide: BorderSide(color: color.withOpacity(0.7)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(5),
//         borderSide: BorderSide(color: color.withOpacity(0.7)),
//       ),
//     ),
//   );
// }
int x9 = 9;
// Color.fromARGB(240, 1, 46, 80),
