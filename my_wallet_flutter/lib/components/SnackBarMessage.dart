import 'package:flutter/material.dart';

SnackBarMessage (BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }