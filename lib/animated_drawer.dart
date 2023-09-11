// import 'package:flutter/material.dart';
// import 'package:shop_app/screens/cart_screen.dart';
// import 'package:shop_app/screens/favorites_screen.dart';
// import 'package:shop_app/screens/settings_screen.dart';
// import 'package:shop_app/shared/constants.dart';
// import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
// import 'package:shop_app/shop_app/shop_layout.dart';
//
// class NavigationDrawerWidget extends StatefulWidget {
//   const NavigationDrawerWidget({Key? key}) : super(key: key);
//
//   @override
//   // State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
// }
//
// class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
//   bool lights = false;
//   final padding = const EdgeInsets.symmetric(horizontal: 10);
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var model = ShopCubit.get(context).userModel;
//     final name = model!.data!.name;
//     final email = model.data!.email;
//     final phone = model.data!.phone;
//
//     return AnimatedDrawer(
//       homePageXValue: 150,
//       homePageYValue: 80,
//       homePageAngle: -0.2,
//       homePageSpeed: 250,
//       shadowXValue: 122,
//       shadowYValue: 110,
//       shadowAngle: -0.275,
//       shadowSpeed: 550,
//       openIcon: const Icon(Icons.menu_open, color: Color(0xFF1f186f)),
//       closeIcon:const Icon(Icons.arrow_back_ios, color:  Color(0xFF1f186f)),
//       shadowColor:const Color(0xFF4c41a3),
//       backgroundGradient:const LinearGradient(
//         colors: [Color(0xFF4c41a3), Color(0xFF1f186f)],
//       ),
//       menuPageContent: Padding(
//         padding: const EdgeInsets.only(top: 100.0, left: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FlutterLogo(
//               size: MediaQuery.of(context).size.width / 4,
//             ),
//             Row(
//               children: [
//                 const Text(
//                   "FLUTTER",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "HOLIC",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue[200],
//                       fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 40),
//             ),
//             const Text(
//               "Home Screen",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 20),
//             ),
//             const Text(
//               "Screen 2",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 20),
//             ),
//             const Divider(
//               color: Color(0xFF5950a0),
//               thickness: 2,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 20),
//             ),
//             const Text(
//               "About",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       homePageContent: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.blue[200],
//         child: Center(
//           child: Image.network(
//             "https://user-images.githubusercontent.com/38032118/105316779-2a480980-5be3-11eb-900e-18fcd599493d.png",
//             height: MediaQuery.of(context).size.height / 2,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildHeader({
//     required String image,
//     required String name,
//     required String email,
//     required String phone,
//     required VoidCallback onClicked,
//   }) =>
//       InkWell(
//         onTap: onClicked,
//         child: Container(
//           padding: padding.add(
//             const EdgeInsets.symmetric(
//               vertical: 40,
//             ),
//           ),
//           child: Row(
//             children: [
//               const CircleAvatar(
//                 radius: 30,
//                 backgroundImage: NetworkImage(
//                   'https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/275966824_1503380736724358_4342121518919894903_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=NMcgGuZ-ptwAX-8ySrE&_nc_ht=scontent.fcai21-1.fna&oh=00_AT9dHsIRVIZF1XgWRI5YL8ySG5XAfdyIWJTJWVbNmkM3AQ&oe=624DBD8B',
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     email,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     phone,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       );
//
//   Widget buildMenuItem({
//     required String text,
//     required String text2,
//     required IconData icon,
//     VoidCallback? onClicked,
//   }) {
//     const hoverColor = Colors.white;
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: Colors.white,
//         size: 25,
//       ),
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             text2,
//             style: const TextStyle(
//               // fontSize: ,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//       hoverColor: hoverColor,
//       onTap: onClicked,
//     );
//   }
// }
