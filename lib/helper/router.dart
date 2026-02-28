import 'package:ecommerce_app_with_firebase/helper/routes.dart';
import 'package:flutter/cupertino.dart';
import '../views/screens/home/ui/button_navbar_home_page.dart';
import '../views/screens/landing_page.dart';
import '../views/screens/login_page.dart';
import '../views/screens/register_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRouters.loginPageRoutes:
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
    case AppRouters.registerPageRoutes:
      return CupertinoPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );
    case AppRouters.buttonNavbarHomePageRoutes:
      return CupertinoPageRoute(
        builder: (context) => const ButtonNavbarHomePage(),
        settings: settings,
      );
    case AppRouters.landingPageRoutes:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
