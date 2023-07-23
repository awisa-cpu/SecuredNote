
import 'package:samsung_note/models/auth/auth_user.dart';

abstract class AuthProvider{

//create account
Future<void> register({required String email, required String password});

//login
Future<AuthUser> login({required String email, required String password});

//get authUser
AuthUser? get user;

//logout
void logout();

//send email verification
void sendEmailVerification();

//initailize
void initializeApp();
}