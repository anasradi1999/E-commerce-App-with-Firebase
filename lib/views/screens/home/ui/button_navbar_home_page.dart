import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'bag_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'shop_screen.dart';

class ButtonNavbarHomePage extends StatelessWidget {
  const ButtonNavbarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
            activeForegroundColor: Colors.red,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: ShopScreen(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "Shop",
            activeForegroundColor: Colors.red,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: BagScreen(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_bag),
            title: "Bag",
            activeForegroundColor: Colors.red,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: FavoriteScreen(),
          item: ItemConfig(
            icon: Icon(Icons.favorite),
            title: "Favorite",
            activeForegroundColor: Colors.red,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: "Profile",
            activeForegroundColor: Colors.red,
            inactiveForegroundColor: Colors.grey,
          ),
        ),

      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
