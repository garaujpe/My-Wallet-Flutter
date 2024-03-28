
import 'package:flutter/material.dart';
import 'package:my_wallet_flutter/components/DialogoAlerta.dart';
import 'package:my_wallet_flutter/components/SnackBarMessage.dart';
import 'package:my_wallet_flutter/consts/Constants.dart';
import 'package:my_wallet_flutter/screens/Inicio.dart';
import 'package:my_wallet_flutter/screens/Registro.dart';
import 'package:my_wallet_flutter/services/AuthService.dart';
import '../components/EditorTexto.dart';
import '../models/Conta.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => __telaLoginState();
}

class __telaLoginState extends State<TelaLogin> {

  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final List<Conta> contas = [];
  
  final _formKey= GlobalKey<FormState>();

  AuthService authService = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(TITULO_APPBAR_LOGIN),
          backgroundColor: Colors.cyan,
        ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EditorTexto(_controladorEmail, DICA_EMAIL_LOGIN, errorText: ERROR_TEXT_EMAIL_LOGIN),
                EditorTexto(_controladorSenha, DICA_SENHA_LOGIN, isSenha: true, errorText: ERROR_TEXT_SENHA_LOGIN),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if(contas.isNotEmpty){
                      if(_verificaSenha(contas.first.senha, _controladorSenha.text)){
                        authService.entrarUsuario(email: _controladorEmail.text, senha: _controladorSenha.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaInicio()));
                        _clearTextField();
                      } else {
                          SnackBarMessage(context, TEXTO_SNACKBAR_LOGIN);
                      }
                    }
                  }
                }, child: const Text(BOTAO_ENTRAR_LOGIN)),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaRegistro())).then((contaRegistrada) => setState(() {
                    contas.add(contaRegistrada);
                  }));
                  _clearTextField();
                }, child: const Text(BOTAO_REGISTRAR_LOGIN)),
                DialogoAlerta(contaRegistrada: contas),
              ],
            ),
      ),
    );
  }

  void _clearTextField() {
    _controladorEmail.clear();
    _controladorSenha.clear();
  }

  bool _verificaSenha(String senhaConta, String senhaDigitada) {
    if(senhaConta == senhaDigitada){
      return true;
    } else {
      return false;
    }
  }
}