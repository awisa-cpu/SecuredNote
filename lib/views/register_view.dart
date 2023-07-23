import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.5, horizontal: 16.5),
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
                onPressed: () => _register(),
                child: const Text('Register'),
              ),

              //login
              TextButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                ),
                child: const Text('Already Registered? Login here'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() {}
}
