
import 'package:flutter/material.dart';
import 'package:my_wallet_flutter/components/EditorTexto.dart';
import 'package:my_wallet_flutter/components/SnackBarMessage.dart';
import 'package:my_wallet_flutter/consts/Constants.dart';
import 'package:my_wallet_flutter/models/Conta.dart';

import '../services/AuthService.dart';

class TelaRegistro extends StatefulWidget {
  const TelaRegistro({super.key});

  @override
  State<TelaRegistro> createState() => _TelaRegistroState();
}

class _TelaRegistroState extends State<TelaRegistro> {

  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorConfirmarSenha = TextEditingController();
  
  final _formKey= GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(TITULO_APPBAR_REGISTRO),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            EditorTexto(_controladorEmail, DICA_EMAIL_REGISTRO, errorText: ERROR_TEXT_EMAIL_REGISTRO,),
            EditorTexto(_controladorSenha, DICA_SENHA_REGISTRO, isSenha: true, errorText: ERROR_TEXT_SENHA_REGISTRO,),
            EditorTexto(_controladorConfirmarSenha, DICA_CONFIRMA_SENHA_REGISTRO, isSenha: true, errorText: ERROR_TEXT_CONFIRMAR_SENHA_REGISTRO,),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_controladorEmail.text.isNotEmpty &&
                      _controladorSenha.text.isNotEmpty &&
                      _controladorConfirmarSenha.text.isNotEmpty) {
                    final verificador = _criandoTelaRegistro(context);
                    if(verificador) {
                      _clearTextField();
                      SnackBarMessage(context, TEXTO_SNACKBAR_CONFIRMA_REGISTRO);
                    } else {
                      SnackBarMessage(context, TEXTO_SNACKBAR_REGISTRO);
                    }
                  }
                }
              },
              child: const Text(BOTAO_REGISTRAR_REGISTRO))
          ],
        ),
      ),
    );
  }

  bool _criandoTelaRegistro(BuildContext context) {
    final String? email = _controladorEmail.text;
    final String? senha = _controladorSenha.text;
    final String? confirmaSenha = _controladorConfirmarSenha.text;
    if(email != null && senha != null && confirmaSenha != null) {
      if(senha == confirmaSenha) {
        final TelaRegistroCriado = Conta(email, senha);
        authService.cadastrarUsuario(email: email, senha: senha);
        Navigator.pop(context, TelaRegistroCriado);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void _clearTextField() {
    _controladorEmail.clear();
    _controladorSenha.clear();
    _controladorConfirmarSenha.clear();
  }
}