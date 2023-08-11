import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_note/utilities/Exceptions/auth/auth_exceptions.dart';
import 'package:samsung_note/utilities/dialogs/show_error_dialog.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';

import 'package:samsung_note/view_controller/auth_bloc.dart';
import 'package:samsung_note/view_controller/auth_event.dart';
import 'package:samsung_note/view_controller/auth_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      //
      body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            //handle error states

            if (state is AuthStateLoggedOut) {
              if (state.exception is InvalidEmailException) {
                showErrorDialog(
                    context: context,
                    title: "Error Dialog",
                    content: "Invalid email, Check and try again");
              } else if (state.exception is UserNotFoundException) {
                showErrorDialog(
                    context: context,
                    title: "Error Dialog",
                    content: "User not found");
              } else if (state.exception is WrongPasswordException) {
                showErrorDialog(
                    context: context,
                    title: "Error Dialog",
                    content: "Invalid password, Check and try again");
              } else if (state.exception is GenericAuthException) {
                showErrorDialog(
                    context: context,
                    title: "Error Dialog",
                    content: "Authentication Error");
              }
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.5, horizontal: 16.5),
              child: Column(
                children: [
                  //email field
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  //
                  const SizedBox(
                    height: 20.5,
                  ),

                  //password
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          showPassword = !showPassword;
                          setState(() {});
                        },
                        icon: Icon(showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: showPassword,
                    autocorrect: false,
                  ),

                  //
                  const SizedBox(
                    height: 30.5,
                  ),

                  //login button
                  TextButton(
                    onPressed: () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      context.read<AuthBloc>().add(
                          AuthEventLogin(email: email, password: password));
                    },
                    child: const Text('Login'),
                  ),

                  //register
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute,
                      (route) => false,
                    ),
                    child: const Text('Not Registered? Register here'),
                  ),

                  //forgot password
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
