import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.5, horizontal: 16.5),
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
                onPressed: () => _login(),
                child: const Text('Login'),
              ),

              //register
              TextButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                ),
                child: const Text('Not Registered? Register here'),
              ),

              //forgot password
              TextButton(
                onPressed: () => _forgotPassword(),
                child: const Text('Forgot password?'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() {}
  void _forgotPassword() {}
}
