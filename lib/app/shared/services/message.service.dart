import 'package:flutter/material.dart';

class MessageService {
  showMsg(
    BuildContext context,
    String message,
    bool status, {
    bool closable = false,
    int duration = 5,
  }) {
    var snackBar = SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 18)),
      backgroundColor: (status) ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      action: (closable)
          ? SnackBarAction(
              label: 'X',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              })
          : null,
      duration:
          (!closable) ? Duration(seconds: duration) : const Duration(days: 365),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
