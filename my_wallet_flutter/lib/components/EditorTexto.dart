import 'package:flutter/material.dart';

class EditorTexto extends StatelessWidget {
  const EditorTexto(this.controlador, this.dica, {super.key, this.isSenha, required this.errorText});

  final TextEditingController controlador;
  final String dica;
  final bool? isSenha;
  final String errorText;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.00, 8.00, 16.00, 8.00),
      child: TextFormField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 16.00,
        ),
        decoration: InputDecoration(
          hintText: dica,
          border: const OutlineInputBorder(),
          fillColor: const Color.fromARGB(255, 233, 232, 232),
          filled: true
        ),
        obscureText: _verificadorDeSenha(isSenha),
        validator: (texto) {
          if (texto!.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }

  bool _verificadorDeSenha(bool? senha) {
    if(senha != null) {
      return senha;
    } else {
      return false;
    }
  }
}