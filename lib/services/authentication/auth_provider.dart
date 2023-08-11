import 'package:samsung_note/models/auth/auth_user.dart';

abstract class AuthProvider {
//create account
  Future<void> registerUser({required String email, required String password});

//login
  Future<AuthUser?> loginUser({required String email, required String password});

//get authUser
  AuthUser? get getCurrentUser;

//logout
  Future<void> logout();

//send email verification
  Future<void> sendEmailVerification();

//initailize
  Future<void> initializeApp();
}
