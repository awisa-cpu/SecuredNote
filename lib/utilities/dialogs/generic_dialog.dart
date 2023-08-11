import 'package:flutter/material.dart';

Future<Object?> showGenericAppDialog<Object>(
    {required BuildContext context,
    required String title,
    required String content,
    required Map<String, Object?> actions}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions.keys.map((e) {
          final value = actions[e];

          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(e),
          );
        }).toList(),
      );
    },
  );
}
