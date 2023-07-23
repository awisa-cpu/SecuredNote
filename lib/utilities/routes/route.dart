import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/routes/routes_constants.dart';
import 'package:samsung_note/views/home.dart';
import 'package:samsung_note/views/new_note.dart';

Route generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case newNoteRoute:
          return const NewNote();

        case homeRoute:
          return const Home();

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
