import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Returns the auth State Changes user using FirebaseAuth.
  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  /// Returns the current user using FirebaseAuth.
  @override
  User? get currentUser => _firebaseAuth.currentUser;

  /// Login with email and password using FirebaseAuth.
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async{
   final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
   return userCredential.user;
  }

  /// Sign up with email and password using FirebaseAuth.
  @override
  Future<User?> signUpWithEmailAndPassword(String email, String password) async{
   final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
   return userCredential.user;
  }

  /// Sign out using FirebaseAuth.
  @override
  Future<void> signOut() async => await _firebaseAuth.signOut();

}

