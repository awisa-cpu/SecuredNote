import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utilities/dialogs/progress_loader.dart';
import '../view_controller/auth_bloc.dart';
import '../view_controller/auth_event.dart';
import '../view_controller/auth_state.dart';
import 'login_view.dart';
import 'notes/notes_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthEventInitialize(loading: false));
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggediIn) {
          return const NotesView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else {
          return const Loader(
            text: 'Waiting ...',
          );
        }
      },
    );
  }
}
