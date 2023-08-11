import 'package:bloc/bloc.dart';
import 'package:samsung_note/services/authentication/auth_provider.dart';
import 'package:samsung_note/view_controller/auth_event.dart';
import 'package:samsung_note/view_controller/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider provider;
  AuthBloc(this.provider) : super(AuthStateInitialize(loading: false)) {
    //handling app initailization
    on<AuthEventInitialize>((event, emit) async {
      await provider.initializeApp();

      final currentUser = provider.getCurrentUser;
      if (currentUser == null) {
        emit(AuthStateLoggedOut(loading: false, exception: null));
      } else {
        emit(AuthStateLoggediIn(user: currentUser));
      }
    });

    //handling login event
    on<AuthEventLogin>((event, emit) async {
      emit(AuthStateLoggedOut(loading: true, exception: null));

      final email = event.email;
      final password = event.password;

      try {
        final user = await provider.loginUser(email: email, password: password);
        emit(AuthStateLoggedOut(loading: false, exception: null));
        emit(AuthStateLoggediIn(user: user!));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });

    //handling logout
    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logout();
        emit(AuthStateLoggedOut(loading: false, exception: null));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });
  }
}
