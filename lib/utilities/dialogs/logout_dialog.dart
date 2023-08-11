import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/dialogs/generic_dialog.dart';

Future<bool?> logoutDialog({
  required BuildContext context,
  required String title,
  required String content,
}) async {
  return showGenericAppDialog<bool?>(
    context: context,
    title: title,
    content: content,
    actions: {
      'No': false,
      'Yes': true,
    },
  );
}
