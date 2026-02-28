import 'package:ecommerce_app_with_firebase/services/auth.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier{
  final AuthBase auth;
  String email;
  String password;

  AuthController({required this.auth,this.email = '',this.password = ''});

  Future<void> submitLogin() async {
      await auth.loginWithEmailAndPassword(email, password);
  }

  Future<void> submitRegister() async {
      await auth.signUpWithEmailAndPassword(email, password);
    }

    Future<void> signOut() async {
    try{
      await auth.signOut();
    }
  catch(e){
      debugPrint(e.toString());
  }
}

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
  }){
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    notifyListeners();
  }
}