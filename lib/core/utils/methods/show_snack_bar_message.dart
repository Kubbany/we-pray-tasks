import 'package:flutter/material.dart';

void showSnackBarMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
