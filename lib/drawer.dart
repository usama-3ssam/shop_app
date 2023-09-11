import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/favorites_screen.dart';
import 'package:shop_app/screens/settings_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shop_app/shop_app_cubit/cubit.dart';
import 'package:shop_app/shop_app/shop_layout.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  bool lights = false;
  final padding = const EdgeInsets.symmetric(horizontal: 10);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = ShopCubit.get(context).userModel;
    final name = model!.data!.name;
    final email = model.data!.email;
    final phone = model.data!.phone;

    return Drawer(
      child: Material(
        color: defaultColor,
        child: ListView(
          children: <Widget>[
            buildHeader(
              // image: 'images/Me.jpeg',
              name: name!,
              email: email!,
              phone: phone!,
              onClicked: () {},
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                    ),
                    child: SwitchListTile(
                        inactiveTrackColor: Colors.grey[700],
                        title: const Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        value: lights,
                        onChanged: (bool value) {
                          setState(() {
                            lights = value;
                          });
                        }),
                  ),
                  buildMenuItem(
                    text: 'Language',
                    text2: 'Language of App',
                    icon: Icons.language,
                    onClicked: () {},
                  ),
                  buildMenuItem(
                    text: 'Home',
                    text2: 'Home Page / Products',
                    icon: Icons.home,
                    onClicked: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopLayout(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                  buildMenuItem(
                    text: 'Carts',
                    text2: 'Products you put in carts',
                    icon: Icons.add_shopping_cart_outlined,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  buildMenuItem(
                    text: 'Favourites',
                    text2: 'Products you interest',
                    icon: Icons.favorite_border,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ),
                      );
                    },
                  ),
                  buildMenuItem(
                    text: 'Updates',
                    text2: 'edit your profile details',
                    icon: Icons.update,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey[400],
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  buildMenuItem(
                    text: 'About Us',
                    text2: 'About Salla app',
                    icon: Icons.error,
                    onClicked: () {},
                  ),
                  buildMenuItem(
                    text: 'Help / Connect us',
                    text2: 'Customer Support',
                    icon: Icons.phone,
                    onClicked: () {},
                  ),
                  buildMenuItem(
                    text: 'Rate Us',
                    text2: 'Rate our app',
                    icon: Icons.star_rate_rounded,
                    onClicked: () {},
                  ),
                  buildMenuItem(
                    text: 'Share App',
                    text2: 'Share app with other',
                    icon: Icons.share,
                    onClicked: () {},
                  ),
                  buildMenuItem(
                    text: 'sign Out',
                    text2: 'Logout From the app',
                    icon: Icons.logout_rounded,
                    onClicked: () {
                      signOut(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    // required String image,
    required String name,
    required String email,
    required String phone,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(
            const EdgeInsets.symmetric(
              vertical: 40,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required String text2,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const hoverColor = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              // fontSize: ,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
