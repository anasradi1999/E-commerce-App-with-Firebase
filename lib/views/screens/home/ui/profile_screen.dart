import 'package:ecommerce_app_with_firebase/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helper/routes.dart';
import '../../../widget/main_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(AuthController auth, context) async {
    try {
      await auth.signOut();

      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
            (route) => false,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

  return Consumer<AuthController>(
      builder: (_, auth, _) {
        return Column(
          children: [
            const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: MainButton(
              text: 'Logout',
              onTap: () => _logout(auth, context),
            ),
          ),
          ]
        );
      },
    );
  }
}
