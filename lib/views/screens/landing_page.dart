import 'package:ecommerce_app_with_firebase/controllers/auth_controller.dart';
import 'package:ecommerce_app_with_firebase/views/screens/home/ui/button_navbar_home_page.dart';
import 'package:ecommerce_app_with_firebase/views/screens/home/ui/home_screen.dart';
import 'package:ecommerce_app_with_firebase/views/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, asyncSnapshot) {
        // if (asyncSnapshot.connectionState == ConnectionState.waiting) {
        //   return CircularProgressIndicator();
        // }
        if (asyncSnapshot.connectionState == ConnectionState.active) {
          final user = asyncSnapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthController>(
              create: (_) => AuthController(auth: auth),
              child: const LoginPage(),
            );
          }
          return ButtonNavbarHomePage();
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
