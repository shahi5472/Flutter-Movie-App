import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

String formatDate(String date) =>
    DateFormat('MMMM d, y').format(DateTime.parse(date));

class Utils {
  static showAlertDialog(BuildContext context,
      {VoidCallback? onPressedCancel, VoidCallback? onPressedRefresh}) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Error"),
          content: const Text("Refresh or Exit"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: false,
              onPressed: onPressedCancel,
              child: const Text("Cancel"),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: onPressedRefresh,
              child: const Text("Refresh"),
            ),
          ],
        );
      },
    );
  }
}
