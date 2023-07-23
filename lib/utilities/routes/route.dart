import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';
import 'package:samsung_note/views/notes/notes_view.dart';
import 'package:samsung_note/views/login_view.dart';
import 'package:samsung_note/views/notes/new_note.dart';
import 'package:samsung_note/views/register_view.dart';

Route generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case newNoteRoute:
          return const NewNote();

        case homeRoute:
          return const NotesView();

        case loginRoute:
          return const LoginView();

        case registerRoute:
          return const RegisterView();

        default:
          return const Scaffold(
            body: Center(
              child: Text('Route Not Found'),
            ),
          );
      }
    },
  );
}
