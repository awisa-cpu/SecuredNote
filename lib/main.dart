import 'package:flutter/material.dart';
import 'package:samsung_note/services/authentication/auth_services.dart';
import 'package:samsung_note/utilities/routes/route.dart';
import 'package:samsung_note/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'secured_note',
      onGenerateRoute: (settings) => generateRoutes(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.fromFirebase().initializeApp(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginView();

          case ConnectionState.waiting:
            return const Loader(
              text: 'In progress ...',
            );

          default:
            return const Loader(
              text: 'Waiting ...',
            );
        }
      },
    );
  }
}

class Loader extends StatelessWidget {
  final String? text;
  const Loader({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? ''),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
