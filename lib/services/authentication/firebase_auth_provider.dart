import 'package:firebase_auth/firebase_auth.dart';
import 'package:samsung_note/firebase_options.dart';
import 'package:samsung_note/models/auth/auth_user.dart';
import 'package:samsung_note/services/authentication/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:samsung_note/utilities/Exceptions/auth/auth_exceptions.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future initializeApp() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<AuthUser?> loginUser(
      {required String email, required String password}) async {
    try {
      //
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUser = getCurrentUser;

      // if (currentUser == null) {
      //   throw UserNotFoundException();
      // }

      return currentUser;
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
  Future<void> logout() async {
    final currentUser = getCurrentUser;
    if (currentUser != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotFoundException();
    }
  }

  @override
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
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
  Future<void> sendEmailVerification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.sendEmailVerification();
      } else {
        throw UserNotFoundException();
      }
    } catch (e) {
      throw CouldNotSendEmailVerificationException();
    }
  }

  @override
  AuthUser? get getCurrentUser =>
      AuthUser.fromFirebase(FirebaseAuth.instance.currentUser);
}
