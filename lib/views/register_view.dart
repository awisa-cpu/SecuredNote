import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';
import 'package:samsung_note/view_controller/auth_bloc.dart';
import 'package:samsung_note/view_controller/auth_event.dart';
import 'package:samsung_note/view_controller/auth_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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
          'Registeration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      //
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.5, horizontal: 16.5),
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
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),

                //
                const SizedBox(
                  height: 30.5,
                ),

                //login button

                TextButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    context.read<AuthBloc>().add(
                          AuthEventRegisterUser(
                              email: email, password: password),
                        );
                  },
                  child: const Text('Register'),
                ),

                //login
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                  ),
                  child: const Text('Already Registered? Login here'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
