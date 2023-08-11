import '../models/auth/auth_user.dart';

abstract class AuthState {
  final bool? isLoading;
  final Exception? exception;
  AuthState({this.isLoading,  this.exception});
}

class AuthStateInitialize extends AuthState {
  AuthStateInitialize({required bool loading})
      : super(isLoading: loading, exception: null);
}

class AuthStateLoggediIn extends AuthState {
  AuthUser user;
  AuthStateLoggediIn({ required this.user});
      
}

class AuthStateLoggedOut extends AuthState {
  AuthStateLoggedOut({required bool loading, required Exception? exception})
      : super(isLoading: loading, exception: exception);
}

class AuthStateRegister extends AuthState {
  AuthStateRegister({required bool loading, required Exception exception})
      : super(isLoading: loading, exception: exception);
}
