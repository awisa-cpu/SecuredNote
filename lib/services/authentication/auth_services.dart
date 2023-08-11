import 'package:samsung_note/models/auth/auth_user.dart';
import 'package:samsung_note/services/authentication/auth_provider.dart';
import 'package:samsung_note/services/authentication/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService({required this.provider});

  factory AuthService.fromFirebase() =>
      AuthService(provider: FirebaseAuthProvider());

  @override
  Future initializeApp() async {
    provider.initializeApp();
  }

  @override
  Future<void> registerUser(
      {required String email, required String password}) async {
    await provider.registerUser(email: email, password: password);
  }

  @override
  Future<void> sendEmailVerification() {
    return provider.sendEmailVerification();
  }

  @override
  AuthUser? get getCurrentUser => provider.getCurrentUser;

  @override
  Future<AuthUser?> loginUser(
      {required String email, required String password}) async {
    return await provider.loginUser(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return provider.logout();
  }
}
