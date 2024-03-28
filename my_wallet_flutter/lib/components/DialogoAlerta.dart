
import 'package:flutter/material.dart';
import 'package:my_wallet_flutter/models/Conta.dart';
import '../consts/Constants.dart';



class DialogoAlerta extends StatefulWidget {
  const DialogoAlerta({super.key, required this.contaRegistrada});

  final List<Conta> contaRegistrada;

  @override
  State<DialogoAlerta> createState() => _DialogoAlertaState();
}

class _DialogoAlertaState extends State<DialogoAlerta> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Conta Criada!!'),
          content: Text(_textoDialog()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      }, 
      child: const Text(BOTAO_VERIFICAR),
    );
  }
  
  String _textoDialog() {
    if(widget.contaRegistrada.isNotEmpty){
      final String email = widget.contaRegistrada.first.conta;
      final String senha = widget.contaRegistrada.first.senha;
      final String textoAtualizado = "Conta $email com a senha: $senha registrada!!";
      return textoAtualizado;
    }
    return "null";
  }
}