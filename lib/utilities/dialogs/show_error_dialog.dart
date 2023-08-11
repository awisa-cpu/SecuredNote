import 'package:flutter/material.dart';
import 'package:samsung_note/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  return showGenericAppDialog(
    context: context,
    title: title,
    content: content,
    actions: {
      "cancel": null,
    },
  );
}
