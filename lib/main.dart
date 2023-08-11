import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_note/services/authentication/firebase_auth_provider.dart';
import 'package:samsung_note/utilities/routes/route.dart';
import 'package:samsung_note/view_controller/auth_bloc.dart';
import 'package:samsung_note/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: MaterialApp(
        title: 'secured_note',
        onGenerateRoute: (settings) => generateRoutes(settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
