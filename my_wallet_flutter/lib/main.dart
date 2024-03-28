import 'package:flutter/material.dart';
import 'package:my_wallet_flutter/screens/Login.dart';

void main() {
  runApp(const MyWallet());
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaLogin(),
    );
  }
}
