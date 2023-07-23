import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  String uid;
  String email;
  bool isEmailVerified;

  AuthUser(
      {required this.uid, required this.email, required this.isEmailVerified});

 static AuthUser? fromFirebase(User? user) {
    return AuthUser(uid: user!.uid, email: user.email!, isEmailVerified: user.emailVerified);
  }
}
