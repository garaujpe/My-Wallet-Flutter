

import 'package:flutter/material.dart';
import 'package:my_wallet_flutter/consts/Constants.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITULO_APPBAR_INICIO),
        backgroundColor: Colors.cyan,
      ),
      body: const Text("Parabens por logar!!"),
    );
  }
}