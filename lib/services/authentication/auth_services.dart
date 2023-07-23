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
  void logout() {
    provider.logout();
  }

  @override
  Future<void> register({required String email, required String password}) async {
   await  provider.register(email: email, password: password);
  }

  @override
  void sendEmailVerification() {
    provider.sendEmailVerification();
  }

  @override
  AuthUser? get user => provider.user;
  
  @override
  Future<AuthUser> login({required String email, required String password}) async{
  return await provider.login(email: email, password: password);
  }
}
