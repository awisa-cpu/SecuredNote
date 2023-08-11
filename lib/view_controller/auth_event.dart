abstract class AuthEvent {
  AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  AuthEventInitialize({required bool loading});
}

class AuthEventLogin implements AuthEvent {
  final String email;
  final String password;

  AuthEventLogin({required this.email, required this.password});
}

class AuthEventLogOut implements AuthEvent {
  AuthEventLogOut();
}

class AuthEventRegisterUser implements AuthEvent {
  final String email;
  final String password;

  AuthEventRegisterUser({required this.email, required this.password});
}
