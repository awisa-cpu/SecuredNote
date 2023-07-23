import 'package:firebase_auth/firebase_auth.dart';
import 'package:samsung_note/models/auth/auth_user.dart';
import 'package:samsung_note/services/authentication/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:samsung_note/utilities/Exceptions/auth/auth_exceptions.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
 Future initializeApp() async {
    await Firebase.initializeApp();
  }

  @override
  Future<AuthUser> login({required String email, required String password}) async{
    try {
      //
     await  FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUser = user;

      return currentUser!;
      //
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();

        case 'user-disabled':
          throw UserDisabledException();

        case 'user-not-found':
          throw UserNotFoundException();

        case 'wrong-password':
          throw WrongPasswordException();

        default:
          throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  void logout() async{
    final currentUser = user;
    if (currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async{
    //
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();

        case 'invalid-email':
          throw InvalidEmailException();

        case 'operation-not-allowed':
          throw OperationNotAllowed();

        case 'weak-password':
          throw WeakPasswordException();

        default:
          throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  void sendEmailVerification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      await currentUser.sendEmailVerification();
    } catch (e) {
      throw CouldNotSendEmailVerificationException();
    }
  }

  @override
  AuthUser? get user =>
      AuthUser.fromFirebase(FirebaseAuth.instance.currentUser);
}
