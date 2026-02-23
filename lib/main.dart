import 'package:ecommerce_app_with_firebase/helper/router.dart';
import 'package:ecommerce_app_with_firebase/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'helper/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthBase>(
            create: (_) => Auth(),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (context) =>
                AuthController(auth: context.read<AuthBase>()),
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          scaffoldBackgroundColor:const Color(0xFFE5E5E5),
          primaryColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRouters.landingPageRoutes,
      ),
    );
  }
}